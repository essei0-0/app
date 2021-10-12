// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from '@/App'
import router from '@/router'
import vuetify from '@/plugins/vuetify'
import ActionCable from 'actioncable'

Vue.config.productionTip = false

const endpoint = 'ws:localhost:3000/cable';
const cable = ActionCable.createConsumer(endpoint);

Vue.prototype.$cable = cable;
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  vuetify,
  components: { App },
  template: '<App/>'
})
