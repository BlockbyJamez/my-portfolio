<script setup>
import { ref, computed } from "vue";
import SkillTag from "../components/SkillTag.vue";

// 每個技能加上熟練度 (1~5)
const skills = ref([
  { name: "HTML", level: 4 },
  { name: "CSS", level: 3 },
  { name: "JavaScript", level: 4 },
  { name: "Vue", level: 3 },
  { name: "Git", level: 2 },
]);

const asc = ref(true);
const minLevel = ref(1); // 篩選下限

// 排序後的技能清單
const sorted = computed(() =>
  [...skills.value]
    .filter((s) => s.level >= minLevel.value)
    .sort((a, b) =>
      asc.value ? a.name.localeCompare(b.name) : b.name.localeCompare(a.name)
    )
);

// 平均熟練度
const avgLevel = computed(() => {
  if (!skills.value.length) return 0;
  const sum = skills.value.reduce((t, s) => t + s.level, 0);
  return (sum / skills.value.length).toFixed(1);
});
</script>

<template>
  <section>
    <h2>技能</h2>

    <div class="controls">
      <button @click="asc = !asc">切換排序: {{ asc ? "A→Z" : "Z→A" }}</button>
      <label>
        最低熟練度
        <select v-model.number="minLevel">
          <option v-for="n in 5" :key="n" :value="n">{{ n }}+</option>
        </select>
      </label>
    </div>

    <p>平均熟練度：{{ avgLevel }}</p>

    <div class="skills">
      <div v-for="s in sorted" :key="s.name" class="skill-item">
        <SkillTag :label="s.name" />
        <span class="stars">{{ "⭐".repeat(s.level) }}</span>
      </div>
    </div>
  </section>
</template>

<style scoped>
.controls {
  display: flex;
  gap: 12px;
  align-items: center;
  margin-bottom: 10px;
}
button {
  cursor: pointer;
}
select {
  margin-left: 6px;
}
.skills {
  display: flex;
  flex-wrap: wrap;
  gap: 8px 16px;
}
.skill-item {
  display: flex;
  align-items: center;
  gap: 6px;
}
.stars {
  color: #e6b800;
  font-size: 0.9rem;
}
</style>
