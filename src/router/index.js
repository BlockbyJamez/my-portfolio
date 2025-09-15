import { createRouter, createWebHashHistory } from "vue-router";
import Home from "../pages/Home.vue";
import Projects from "../pages/Projects.vue";
import Skills from "../pages/Skills.vue";
import Contact from "../pages/Contact.vue";

export default createRouter({
  history: createWebHashHistory(),
  routes: [
    { path: "/", component: Home },
    { path: "/projects", component: Projects },
    { path: "/skills", component: Skills },
    { path: "/contact", component: Contact },
  ],
});
