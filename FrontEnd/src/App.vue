<template>
  <div id="app" style="height:100%">
    <div style="height:15%; margin-left:10px;">
      <table style="width:100%">
        <td>
          <img alt="Vue logo" src="./assets/FirecastLogo1_Cor.png" style="height:30%" align="left" />
        </td>
        <td>
          <div class="topnav" valign="center">
            <input type="text" placeholder="Buscar.." style="margin-right: 0;" v-model="search" @keyup.enter="search"/>
          </div>
        </td>
        <td style="align: center;">
          <button class="topbtn" @click="doSearch">Pesquisar</button>
        </td>
      </table>
    </div>
    <GoogleMap :lat="latitude" :long="longitude" :key="componentKey"></GoogleMap>
  </div>
</template>

<script>
import GoogleMap from "./components/GoogleMap.vue";
import axios from "axios";
export default {
  name: "app",
  components: {
    GoogleMap
  },
  data() {
    return {
      search: null,
      latitude: null,
      longitude: null,
      componentKey: 0
    };
  },
  methods: {
    async doSearch() {
      const GoogleAPIKey = "AIzaSyA67Wi0ofK9A7nvIiFzShhmbzMFJh-73E0";
      let GeoCodingURL = `https://maps.googleapis.com/maps/api/geocode/json?address=${this.search}&key=${GoogleAPIKey}`;
      let result = await axios.get(GeoCodingURL);
      this.latitude = result.data.results[0].geometry.location.lat;
      this.longitude = result.data.results[0].geometry.location.lng;
      this.componentKey++;
    }
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: right;
  color: #2c3e50;
}
.topnav input[type="text"] {
  float: right !important;
  padding: 6px;
  margin-top: 50px;
  border-radius: 20px;
  width: 500px;
  margin-bottom: 12px;
}
.topbtn {
  float: right !important;
  border-radius: 20px;
  padding: 5px;
  margin-bottom: 12px;
}
</style>
