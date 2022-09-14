<template>
  <!-- {{ message }}
  <ButtonCounter /> -->
  <IndexMovies />
</template>
<script>
import ButtonCounter from "./components/ButtonCounter.vue";
import IndexMovies from "./components/IndexMovies.vue";
export default {
  data() {
    return {
      message: "Hi",
    };
  },
  components: {
    ButtonCounter,
    IndexMovies,
  },
};
</script>
