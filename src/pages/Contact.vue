<script setup>
import { reactive, computed, ref, watch } from "vue";

const form = reactive({ name: "", email: "", msg: "" });
const sent = ref(false);

const emailOK = computed(() => /\S+@\S+\.\S+/.test(form.email));
const msgOK = computed(() => form.msg.length >= 10);
const isValid = computed(() => emailOK.value && msgOK.value);

const nameWarn = ref("");
watch(
  () => form.name,
  (n) => {
    nameWarn.value = n.length && n.length < 2 ? "姓名至少 2 個字" : "";
  }
);

let submit = () => {
  if (!isValid.value) return;
  sent.value = true;
};
</script>

<template>
  <section>
    <h2>聯絡我 (僅展示用)</h2>
    <form @submit.prevent="submit">
      <label>姓名<input v-model.trim="form.name" /></label>
      <label>Email<input v-model.trim="form.email" /></label>
      <label>訊息<textarea v-model="form.msg" rows="4"></textarea></label>

      <p v-if="nameWarn" style="color: #c00">{{ nameWarn }}</p>
      <p v-if="!isValid" style="color: #c00">
        請完整填寫正確 Email 與至少 10 字訊息
      </p>

      <button :disabled="!isValid">送出</button>
      <p v-if="sent">已送出(示範：僅在前端顯示)</p>
    </form>
  </section>
</template>

<style scoped>
form {
  display: grid;
  gap: 12px;
  max-width: 520px;
}
label {
  display: grid;
  gap: 6px;
}
input,
textarea {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 6px;
}
button {
  padding: 10px 14px;
  border: 0;
  border-radius: 8px;
  background: #222;
  color: #fff;
  cursor: pointer;
}
button[disabled] {
  opacity: 0.5;
}
</style>
