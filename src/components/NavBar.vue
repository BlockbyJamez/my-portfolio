<template>
  <nav class="nav">
    <router-link to="/">Home</router-link>
    <router-link to="/projects">Projects</router-link>
    <router-link to="/skills">Skills</router-link>
    <router-link to="/contact">Contact</router-link>
  </nav>
</template>

<style>
.nav {
  display: flex;
  gap: 16px;
  padding: 12px 0;
  flex-wrap: wrap;
}
.nav a.router-link-active {
  font-weight: 700;
  text-decoration: underline;
}
</style>
