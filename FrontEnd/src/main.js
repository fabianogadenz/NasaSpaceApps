import Vue from 'vue';
import App from './App.vue';
import * as VueGoogleMaps from 'vue2-google-maps';

Vue.config.productionTip = false;

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyC0NUxKZbKLOluE-IBLwHk8trz7q-seBEw',
    libraries: 'places' // necessary for places input
  }
});

new Vue({
  render: h => h(App)
}).$mount('#app');
