<template>
  <body style="background: -webkit-linear-gradient(left, #181818, #4c5265)">
    <div class="container">
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
    fetch("http://localhost:5100/movies")
      .then((res) => res.json())
      .then((data) => (this.movies = data))
      .catch((err) => console.log(err.message));
  },
};
</script>

<style>
body {
  box-shadow: 0 10px 50px rgb(122, 121, 121),
    inset 0 5px 50px rgb(163, 163, 163);

  background: radial-gradient(ellipse at bottom, #0d1d31 0%, #0c0d13 100%);
  overflow: hidden;
}
/* @import "./assets/css/style.css"; */

.card:hover {
  -webkit-box-shadow: -1px 9px 40px -12px rgba(195, 192, 192, 0.75);
  -moz-box-shadow: -1px 9px 40px -12px rgba(195, 192, 192, 0.75);
  box-shadow: -1px 9px 40px -12px rgba(195, 192, 192, 0.75);
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
  background: -webkit-linear-gradient(left, #181818, #4c5265);
}
.topnav {
  overflow: hidden;
  background-color: -webkit-linear-gradient(left, #181818, #4c5265);
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
  background-color: white;
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

li,
a,
button {
  font-family: "Montserrat", sans-serif;
  font-weight: 500;
  font-size: 16px;
  color: #f2f2f2;
  text-decoration: none;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 30px 10%;
}

.logo {
  cursor: pointer;
}
.nav__links {
  list-style: none;
}
.nav__links li {
  display: inline-block;
  padding: 0px 20px;
}

.nav_links li a {
  transition: all 0.3s ease 0s;
}

.nav_links li a:hover {
  color: blue;
}

button {
  padding: 9px 25px;
  background-color: rgba(0, 136, 169, 1);
  border: none;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease 0s;
}

button:hover {
  background-color: rgb(5, 5, 5);
}
</style>
