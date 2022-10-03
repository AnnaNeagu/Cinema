<template>
  <body style="background: -webkit-linear-gradient(left, #181818, #4c5265)">
    <h1>Shadow Cinema</h1>
    <div class="register">
      <div class="stars">
        <div class="star"></div>
        <div class="star"></div>
      </div>
      <div class="col-md-12 register-right">
        <div class="tab-content" id="myTabContent">
          <div class="row register-form">
            <form>
              <div class="row justify-content-md-center">
                <div class="col-md-4">
                  <label>Title</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Title"
                    v-model="state.title"
                  />
                  <span v-if="v$.title.$error">
                    {{ v$.title.$errors[0].$message }}
                  </span>

                  <div class="invalid-feedback">Please enter a name.</div>
                </div>
                <div class="col-md-4">
                  <label>Year of release</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Year"
                    v-model="state.year"
                  />
                  <span v-if="v$.year.$error">
                    {{ v$.year.$errors[0].$message }}
                  </span>

                  <div class="invalid-feedback">Please enter a bar code.</div>
                </div>
              </div>
              <div class="row justify-content-md-center">
                <div class="col-md-4">
                  <label> Generes </label>
                  <div class="input-group has-validation">
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Generes"
                      v-model="state.generes"
                    />

                    <div class="invalid-feedback">Please enter a price.</div>
                  </div>
                  <span v-if="v$.generes.$error">
                    {{ v$.generes.$errors[0].$message }}
                  </span>
                </div>

                <div class="col-md-4">
                  <label>Image</label>
                  <input
                    class="form-control"
                    type="file"
                    ref="inputFile"
                    @change="uploadFile()"
                  />
                </div>
              </div>
              <div class="row justify-content-md-center">
                <div class="col-md-4">
                  <label>Running time</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Running Time"
                    v-model="state.running_time"
                  />
                  <span v-if="v$.running_time.$error">
                    {{ v$.running_time.$errors[0].$message }}
                  </span>

                  <div class="invalid-feedback">Please enter a name.</div>
                </div>
                <div class="col-md-4">
                  <label>Trailer (link)</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Trailer"
                    v-model="state.trailer"
                  />
                  <span v-if="v$.trailer.$error">
                    {{ v$.trailer.$errors[0].$message }}
                  </span>

                  <div class="invalid-feedback">Please enter a bar code.</div>
                </div>
              </div>
              <div class="row justify-content-md-center">
                <div class="col-md-8">
                  <label>Description</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Description"
                    v-model="state.description"
                  />
                  <span v-if="v$.description.$error">
                    {{ v$.description.$errors[0].$message }}
                  </span>
                </div>

                <div
                  class="form-group"
                  align="center"
                  style="color: 52b788; margin-top: 20px"
                >
                  <button type="button" class="button" @click="submitForm">
                    Add new movie
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</template>

<script>
import useValidate from "@vuelidate/core";
import { required } from "@vuelidate/validators";
import { reactive, computed } from "vue";
import axios from "axios";
export default {
  name: "NewMovie",
  setup() {
    const state = reactive({
      title: "",
      year: "",
      generes: "",
      image: null,
      running_time: "",
      trailer: "",
      description: "",
    });

    const rules = computed(() => {
      return {
        title: { required },
        year: { required },
        generes: { required },
        running_time: { required },
        trailer: { required },

        description: { required },
        // description: { required, minLength: minLength(10) },
      };
    });
    const v$ = useValidate(rules, state);

    return {
      state,
      v$,
    };
  },
  methods: {
    // onFileSelected(event) {
    //   this.state.image = event.target.files[0];
    //   console.log(this.state.image.name);
    //   console.log(event.target.files[0]);
    // },

    uploadFile: function () {
      this.state.image = this.$refs.inputFile.files[0];
      console.log(this.state.image);
      console.log(this.state);
    },
    async submitForm() {
      this.v$.$validate();
      if (!this.v$.$error) {
        alert("Form successfuly submitted.");
        //adding data by constant res

        const res = await axios.post(
          //path to rails app
          "http://localhost:5100/movies",
          {
            //data taken from the form
            title: this.state.title,
            year: this.state.year,
            generes: this.state.generes,
            image: this.state.image,
            running_time: this.state.running_time,
            trailer: this.state.trailer,
            description: this.state.description,

            headers: {
              origin: "http://localhost:3000",
            },
          }
        );
        console.log(this.state.title);
        console.log(this.state.year);
        console.log(this.state.generes);
        console.log(this.state.image);
        console.log(this.state.running_time);
        console.log(this.state.trailer);
        console.log(this.state.description);
        //for test in console
        console.log(res);
        //if the data is added correctly
        if (res.status == 200) {
          //redirect to products page
          // this.$router.replace("http://localhost:5100/welcome/index");
          this.$swal.fire({
            position: "top-end",
            icon: "success",
            title: "Your work has been saved",
            showConfirmButton: false,
            timer: 1500,
          });
          setTimeout(function () {
            window.location.href = "http://localhost:5100/welcome/index";
          }, 1800);
        }
      } else {
        alert("Form failed validation.");
        console.log(this.state.title);
        console.log(this.state.year);
        console.log(this.state.generes);
        console.log(this.state.image);
        console.log(this.state.running_time);
        console.log(this.state.trailer);
        console.log(this.state.description);
      }
    },
    postData(e) {
      this.axios.post("http://localhost:5100/movies");
      console.warn(this.state);
      e.preventDefault();
    },
  },
};
</script>

<style scoped>
h1 {
  color: white;
  text-shadow: 2px 5px 5px #5cb8e4;
  text-align: center;
}
.register {
  background: -webkit-linear-gradient(left, #181818, #4c5265);
  margin-top: 0%;
  padding: 10%;
  box-shadow: 0 10px 50px rgb(122, 121, 121),
    inset 0 5px 50px rgb(163, 163, 163);
}
.register-left {
  text-align: center;
  color: #fff;
  margin-top: 1%;
}
.register-left input {
  border: none;
  border-radius: 1.5rem;
  padding: 2%;
  width: 60%;
  background: #f8f9fa;
  font-weight: bold;
  color: #383d41;
  margin-top: 10%;
  margin-bottom: 3%;
  cursor: pointer;
}
.register-right {
  background: #fff;
  border-top-left-radius: 10% 50%;
  border-bottom-left-radius: 10% 50%;
  border-top-right-radius: 10% 50%;
  border-bottom-right-radius: 10% 50%;
  box-shadow: 0 10px 50px rgb(122, 121, 121),
    inset 0 5px 50px rgb(163, 163, 163);

  background: radial-gradient(ellipse at bottom, #0d1d31 0%, #0c0d13 100%);
  overflow: hidden;
}
.register-left img {
  margin-top: 15%;
  margin-bottom: 5%;
  width: 15%;
  -webkit-animation: mover 2s infinite alternate;
  animation: mover 1s infinite alternate;
}
@-webkit-keyframes mover {
  0% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-20px);
  }
}
@keyframes mover {
  0% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-20px);
  }
}
.register-left p {
  font-weight: lighter;
  padding: 12%;
  margin-top: 0%;
}
.register .register-form {
  padding: 10%;
  margin-top: 0%;
}
.btnRegister {
  float: right;
  margin-top: 10%;
  border: none;
  border-radius: 1.5rem;
  padding: 2%;
  background: #0062cc;
  color: #fff;
  font-weight: 600;
  width: 50%;
  cursor: pointer;
}
.register .nav-tabs {
  margin-top: 3%;
  border: none;
  background: #0062cc;
  border-radius: 1.5rem;
  width: 28%;
  float: right;
}
.register .nav-tabs .nav-link {
  padding: 2%;
  height: 34px;
  font-weight: 600;
  color: #fff;
  border-top-right-radius: 1.5rem;
  border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover {
  border: none;
}
.register .nav-tabs .nav-link.active {
  width: 100px;
  color: #0062cc;
  border: 2px solid #0062cc;
  border-top-left-radius: 1.5rem;
  border-bottom-left-radius: 1.5rem;
}
.register-heading {
  text-align: center;
  margin-top: 8%;
  margin-bottom: -15%;
  color: #495057;
}
/* .container{
            margin-top: 8%;
            margin-left: 8%;
            } */
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

  background: -webkit-linear-gradient(left, black, black);
}
.topnav {
  overflow: hidden;
  background-color: -webkit-linear-gradient(left, black, black);
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

.div1 {
  height: 20rem;
  width: 30rem;
  margin: 20rem;
  border-radius: 30px;
  background-color: white;
}
label {
  color: #f8ede3;
}
.button {
  padding: 15px 25px;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: rgb(0, 0, 0);
  background-color: #f8ede3;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {
  background-color: #b3e8e5;
}

.button:active {
  background-color: #b3e8e5;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
