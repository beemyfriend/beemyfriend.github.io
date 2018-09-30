Vue.component('state-info', {
  template: `
  <div class='state' v-bind:style="{position: 'absolute', width: dynamicWidth + '%', height: '100%', left: ((stateindex - 1) * dynamicWidth) + '%'}">
    <select v-model="selectedState">
      <option disabled value="">Please select a state</option>
      <option v-for="state in stateData.map(d => d.USStateName)" v-bind:value='state'>
        {{state}}
      </option>
    </select>
    <br />
    <template v-if="selectedState != ''">
      <court-layout v-bind:courtdata="stateData.filter(x => x.USStateName == selectedState)[0]"
                    v-bind:stateindex="stateindex"></court-layout>
    </template>
  </div>
  `,
  props: ['stateindex'],
  data() {
    return {
      selectedState: ''
    }
  },
  computed: {
    stateData(){
      return store.state.stateData
    },
    dynamicWidth(){
      if(store.state.stateCount < 3){return 100/store.state.stateCount }
      return 33
    }
  }
})
