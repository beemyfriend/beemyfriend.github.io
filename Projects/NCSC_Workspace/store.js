const store = new Vuex.Store({
  state: {
    stateData: data,
    stateCount: 0,
    courtTypes: courtTypes
  },
  mutations: {
    addState(state){
      state.stateCount++
    }
  }
})
