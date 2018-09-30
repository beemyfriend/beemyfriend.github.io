Vue.component('state-counter', {
  template: `
  <div class='counter'>
    <button onclick="store.commit('addState')">Add State</button>
  </div>
  `
})
