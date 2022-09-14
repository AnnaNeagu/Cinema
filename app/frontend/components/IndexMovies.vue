<template>
  <body style="background: -webkit-linear-gradient(left, #181818, #f2f2f2)">
    <div class="container">
      <h1 class="display-1" style="text-align: center">Cinema Stars Movies</h1>
      <div class="row row-cols-1 row-cols-md-3 g-6" style="text-align: center">
        <div v-for="movie in movies" :key="movie.id">
          <div class="col-4-lg">
            <router-link
              style="text-decoration: none; color: inherit"
              :to="{ name: 'Movie', params: { id: movie.id } }"
            >
              <div class="card" style="width: 18rem">
                <div class="card-body">
                  <h5 class="card-title">
                    <p>{{ movie.title }}</p>
                  </h5>
                  <p class="card-text">
                    <br />
                    {{ movie.description }}
                  </p>
                </div>
              </div>
              <br />
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>

<script>
export default {
  data() {
    return {
      movies: [],
    };
  },
  mounted() {
    fetch("http://localhost:5100/movies/index")
      .then((res) => res.json())
      .then((data) => (this.movies = data))
      .catch((err) => console.log(err.message));
  },
};
</script>

<style>
/* @import "./assets/css/style.css"; */

.card:hover {
  -webkit-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
  box-shadow: -1px 9px 40px -12px rgba(0, 0, 0, 0.75);
}
/* _card.scss:41 */
.card-title {
  color: green;
}
.card-text {
  color: green;
}
body {
  margin: 0;
  /* font-family: Times New Roman, Helvetica, sans-serif; */
  background: -webkit-linear-gradient(left, #181818, #f2f2f2);
}
.topnav {
  overflow: hidden;
  background-color: -webkit-linear-gradient(left, #181818, #f2f2f2);
}
.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav a:hover {
  background-color: black;
  color: #52b788;
}
.topnav a.active {
  background-color: #04aa6d;
  color: #52b788;
}
.topnav .icon {
  display: none;
}
@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}
@media screen and (max-width: 600px) {
  .topnav.responsive {
    position: relative;
  }
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
