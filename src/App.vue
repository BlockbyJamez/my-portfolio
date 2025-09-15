<script setup>
import NavBar from "./components/NavBar.vue";
import FooterBar from "./components/FooterBar.vue";
</script>

<template>
  <div class="container">
    <NavBar />
    <router-view />
    <FooterBar author="黃均皓" />
  </div>
</template>

<style scoped>
.container {
  max-width: 980px;
  margin: 0 auto;
  padding: 16px;
}
</style>
