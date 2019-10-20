<template>
  <div style="height:80%">
    <br />
    <gmap-map :center="center" :zoom="12" style="width:100%;  height:100%;">
      <gmap-marker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        @click="center=m.position"
      ></gmap-marker>
    </gmap-map>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "GoogleMap",
  props: ["lat", "long"],
  data() {
    return {
      center: { lat: -25.297, lng: -54.094 },
      markers: [],
      places: [],
      currentPlace: null
    };
  },
  async mounted() {
    let checkInlatitude = parseFloat("-25.297");
    let checkInlongitude = parseFloat("-54.094");
    if (this.lat != null && this.long != null) {
      checkInlatitude = this.lat;
      checkInlongitude = this.long;
    }
    this.markers.push({
      position: { lat: checkInlatitude, lng: checkInlongitude }
    });
    this.center = { lat: checkInlatitude, lng: checkInlongitude };
    if (this.lat == null && this.long == null) {
      this.geolocate();
    }

    let result = await axios.get("http://192.168.137.1:3000/complaint/getall");
    result.data.forEach(element => {
      this.markers.push({
        position: {
          lat: parseFloat(element.latitude),
          lng: parseFloat(element.longitude)
        }
      });
    });
  },
  methods: {
    // receives a place object via the autocomplete component
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng()
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
    geolocate: function() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
      });
    }
  }
};
</script>