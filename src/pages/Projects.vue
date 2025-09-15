<script setup>
import { ref, computed, onMounted } from "vue";
import SkillTag from "../components/SkillTag.vue";

const projects = ref([]);
const loading = ref(false);
const error = ref("");
const keyword = ref("");

onMounted(async () => {
  loading.value = true;
  try {
    const res = await fetch("data/projects.json");
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    projects.value = await res.json();
  } catch (e) {
    error.value = "載入失敗，請稍後再試";
    console.error(e);
  } finally {
    loading.value = false;
  }
});

const filtered = computed(() => {
  const k = keyword.value.toLowerCase();
  return projects.value.filter(
    (p) => p.title.toLowerCase().includes(k) || p.desc.toLowerCase().includes(k)
  );
});
</script>

<template>
  <section>
    <h2>作品集</h2>

    <input v-model="keyword" placeholder="搜尋作品..." />
    <p v-if="loading">載入中...</p>
    <p v-if="error">{{ error }}</p>

    <ul v-if="!loading && filtered.length">
      <li v-for="(p, i) in filtered" :key="i">
        <h3>{{ p.title }}</h3>
        <p>{{ p.desc }}</p>
        <p>技術：<SkillTag v-for="(t, ti) in p.tech" :key="ti" :label="t" /></p>
        <a :href="p.url" target="_blank" rel="noreferrer">查看作品</a>
      </li>
    </ul>

    <p v-if="!loading && !filtered.length">沒有符合的作品。</p>
  </section>
</template>

<style scoped>
input {
  padding: 8px;
  margin: 8px 0;
  width: 100%;
  max-width: 320px;
}
li {
  margin: 12px 0;
  border-bottom: 1px solid #eee;
  padding-bottom: 12px;
}
</style>
