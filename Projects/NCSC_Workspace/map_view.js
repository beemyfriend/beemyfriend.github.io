Vue.component('states-layout', {
  template: `
  <div id="mapContainer" style='position: fixed; width: 100%; height: 100%; overflow: scroll'>
    <svg style='position: absolute; width: 100%; height: 100%'>
      <g id="mapG">
        <path v-for="lines in mapData"
          :id="'state_' + lines.id"
          :d="mapPath(lines)"
          stroke='black'
          :fill='caseLoadColor(lines.CaseLoad)'
          @mouseover="mouseover(lines)"
          @mouseout='mouseout(lines)'
          @click='click(lines)'
          ></path>
      </g>
    </svg>
  </div>
  `,
  data() {
    return {

    }
  },
  mounted(){
    d3.select(window)
      .on('resize', this.sizeChange)

    this.sizeChange()
  },
  methods: {
    courtTypeScale(d){
      return d3.scaleBand()
        .domain(courtTypes)
        .range([0,90])(d)
    },
    sizeChange(){
      if(d3.select('#mapContainer').node()){
        sWidth = d3.select('#mapContainer').node().getBoundingClientRect().width
        console.log(sWidth)
        d3.select('#mapG').attr('transform', `scale(${sWidth/1000})`)
        d3.select('svg').attr('height', sWidth * .618)
      }
    },
    mouseover(line){
      d3.select('#state_' + line.id)
        .attr('stroke','red')
        .attr('stroke-width', 5)
        .raise()
    },
    mouseout(line){
      d3.select('#state_' + line.id)
        .attr('stroke','black')
        .attr('stroke-width', 1)
    },
    click(d){
      console.log('inside click')
      console.log(d.fullState)
      store.commit('changeChosenState', d.fullState)
      store.commit('changeView', 'courts')
    },
    mapPath: d3.geoPath(),
    caseLoadColor: d3.scaleOrdinal()
      .domain([1,2,3,4,5,6])
      .range(["#E6E6E6", "#D1D1D1", "#BBBBBB", "#A0A0A0", "#7F7F7F", "#4D4D4D"])
  },
  computed: {
    mapData(){
      tempd = topojson
        .feature(us_topo, us_topo.objects.states)
        .features
        .map(x => {
          matching = state_data.filter(d => d.id == x.id)[0]
          x.fullState = matching.STATE_NAME
          x.CaseLoad = matching.TrialCaseloadSizeID
          x.TrialStructure = matching.TrialStructureID
          x.DeathPenalty = matching.DeathPenaltyID
          x.PopulationCategory = matching.PopulationCategoryID,
          x.Rural = matching.RuralID
          return x
        })
      console.log(tempd)
      return tempd
    }
  }
})
