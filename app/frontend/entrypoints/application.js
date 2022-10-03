import "bootstrap/dist/css/bootstrap.min.css";
import { createApp } from "vue/dist/vue.esm-bundler";
import App from "../App.vue";

import VueSweetalert2 from "vue-sweetalert2";
import "sweetalert2/dist/sweetalert2.min.css";

createApp(App).use(VueSweetalert2).mount("#app");
