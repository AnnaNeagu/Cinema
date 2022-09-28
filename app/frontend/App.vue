<template>
  <Navbar />
  <p v-if="currentUrl == movie"><IndexMovies /></p>
  <p v-if="currentUrl == newmovie"><NewMovie /></p>
</template>
<script>
// import ButtonCounter from "./components/ButtonCounter.vue";
import IndexMovies from "./components/IndexMovies.vue";
import NewMovie from "./components/NewMovie.vue";
import Navbar from "./components/Navbar.vue";

export default {
  data() {
    return {
      // message: "Hi",
      currentUrl: window.location.href,
      newmovie: "http://localhost:5100/movies/new",
      movie: "http://localhost:5100/welcome/index",
    };
  },
  components: {
    // ButtonCounter,
    IndexMovies,
    NewMovie,
    Navbar,
  },
  created() {
    this.currentUrl = window.location.href;
    console.log(this.currentUrl);
  },
  methods: {},
};
</script>
