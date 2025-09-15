<script setup>
import { computed } from "vue";

const props = defineProps({
  author: { type: String, default: "Name" },
});

const year = computed(() => new Date().getFullYear());
</script>

<template>
  <footer class="footer">
    <p>© {{ year }} {{ author }}. All rights reserved.</p>
  </footer>
</template>

<style scoped>
.footer {
  margin-top: 32px;
  padding: 16px 0;
  border-top: 1px solid #eee;
  font-size: 0.9rem;
  text-align: center;
  color: #666;
}
</style>
