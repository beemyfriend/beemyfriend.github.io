
Vue.component('court-layout', {
  template: `
  <div :class='"state_" + stateindex' style="position: absolute; width: 100%; height: 100%;">
    <div :class='"chart_" + stateindex' style="top: 0%; height: 100%; width: 100%; overflow: scroll">
      <svg :class='"chart_" + stateindex' style="position: absolute; width: 100%; height: 100%">
        <template v-for='x in filteredCourtTypes.Courts'>
          <template v-for="y, i in x">
            <circle :cx="y.styleChart.left"
                    :cy="y.styleChart.top"
                    transform='translate(20, 20)'
                    r=.0001></circle>
          </template>
        </template>
        <line v-for="d in courtdata.ChildParent"
              :x1="filteredCourtTypes.LineKey[d.Child].x"
              :y1="filteredCourtTypes.LineKey[d.Child].y"
              :x2="filteredCourtTypes.LineKey[d.Parent].x"
              :y2="filteredCourtTypes.LineKey[d.Parent].y"
              style="stroke: black; stroke-width: 2"
              transform= "translate(30, 20)"
              :class="d.Child + ' ' + d.Parent">
        </line>
      </svg>
      <div :class='"chart_" + stateindex' style="position: absolute; top: 0%; left: 0%; height: 100%; width: 100%">
        <template v-for='x in filteredCourtTypes.Courts'>
          <template v-for="y, i in x">
            <p :class="y.data.CourtLevelID"
               :style='y.styleChart'
               :id="y.CourtID"
               @mouseover="matchSimilar( y.data)"
               @mouseout="unmatchSimilar( y.data)"
               @click="courtInfo(y.data)">
                <template v-for="z,i in y.data.CourtName">
                  <br v-if="i != 0">
                  {{z}}
                </template>
            </p>
          </template>
        </template>
      </div>
    </div>
    <div :id='"info_" + stateindex' style="position: absolute; bottom: 0%; height: 0%; width: 100%; overflow: scroll">
    </div>
  </div>
  `,
  data() {
    return {

    }
  },
  props: ['courtdata', 'stateindex'],
  methods: {
    courtTypeScale(d){
      return d3.scaleBand()
        .domain(courtTypes)
        .range([0,90])(d)
    },
    matchSimilar(d){
      d3.selectAll("." + d.CourtLevelID)
        .style("background", 'yellow')
      d3.selectAll('line.' + d.CourtID)
        .style("stroke", "blue")
        .style("stroke-width", 4)
    },
    unmatchSimilar(d){
      d3.selectAll("." + d.CourtLevelID)
        .style("background", 'white')
      d3.selectAll('line.' + d.CourtID)
        .style("stroke", "black")
        .style("stroke-width", 2)
    },
    closeInfo(){
      d3.selectAll(".chart_" + this.stateindex)
        .style("height", "100%")
      d3.select('#info_' + this.stateindex)
        .style('heigth', '0%')
    },
    courtInfo(d){
      console.log(d.Notes)
      d3.select("#info_" + this.stateindex)
        .style("height", "40%")
        .html(
          `
          <a href="#" @click="${this.closeInfo}" >&#11015;</a>
          <a href="${d.Link}" ><b>${d.CourtName.join(' ')} (${d.CourtLevelID})</b></a><br><br>
          <b>Funding Source:</b> ${d.FundingDescription}<br>
          <b>Appeal From Admin Agency:</b> ${d.AppealFromAdminAgency}<br>
          <b>Notes:</b> ${d.Notes}<br><br>


          <table>
          <th>
            <tr>
              <td>Description</td>
              <td>Original<br>Proceeding?</td>
              <td>Interlocutory<br>Appeal?</td>
              <td>Appeal<br>by<br>Permission?</td>
              <td>Appeal<br>by<br>Right?</td
            </tr>
          <th>
          ${d.CaseTypes.map(x => "<tr><td>" +
            x.CaseTypeDescription +
            "</td><td>" +
             x.OriginalProceeding +
            '</td><td>' +
            x.InterlocutoryAppeal +
            '</td><td>' +
            x.AppealByPermission +
            '</td><td>' +
            x.AppealByRight +
            '</td></tr>').join('')}
          </table>
          `
        )

      d3.selectAll(".chart_" + this.stateindex)
        .style("height", "60%")
    }
  },
  computed: {
    filteredCourtTypes(){
      lineKey = {}

      temp = store.state.courtTypes.map(
        x => {

          temp = this
            .courtdata
            .Courts
            .filter(d => d.CourtLevelID == x)

          temp = temp.map((d,i) => {
              courtObj = {
                CourtID: d.CourtID,
                data: d,
                styleChart: {
                  position: "absolute",
                  left: (1/temp.length * 100) * i + (1/temp.length*50) + '%',
                  top:  this.courtTypeScale(d.CourtLevelID) + "%",
                  background: 'white',
                  margin: '0',
                  padding: '5',
                  'text-align': 'center',
                  border: d.AppealFromAdminAgency == 0 ?'2px solid black' : '3px solid red'
                }
              }

              lineKey[courtObj.CourtID] = {x: courtObj.styleChart.left, y: courtObj.styleChart.top}

              return courtObj
            })

          return temp
        }
      )

      temp = {Courts: temp, LineKey: lineKey}

      return temp
    }
  }
})
