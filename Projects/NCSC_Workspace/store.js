const store = new Vuex.Store({
  state: {
    stateData: data,
    stateCount: 1,
    courtTypes: courtTypes,
    view: 'map',
    chosenState: ''
  },
  mutations: {
    addState(state){
      state.stateCount++
    },
    changeView(state, payload){
      state.view = payload
      if(payload == 'map'){state.stateCount = 1}
    },
    changeChosenState(state, payload){
      state.chosenState = payload
    }
  }
})
