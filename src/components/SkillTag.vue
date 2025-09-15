<script setup>
defineProps({ label: { type: String, required: true } });
</script>

<template>
  <span class="tag">{{ label }}</span>
</template>

<style>
.tag {
  display: inline-block;
  padding: 4px 8px;
  border: 1px solid #ccc;
  border-radius: 8px;
  margin: 4px;
}
</style>
