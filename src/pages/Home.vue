<script setup>
import { ref, computed, onMounted, onUnmounted } from "vue";

const name = ref("黃均皓");
const showIntro = ref(false);
const displayName = computed(() => name.value.trim() || "Anonymous");

const motto = ref("持續學習，持續成長");
const hobbies = ref(["Youtube 線上課程學習", "Vue.js 練習", "打籃球"]);

const currentTime = ref(new Date().toLocaleTimeString());

let toggleIntro = () => {
  showIntro.value = !showIntro.value;
};

//lifecycle hook:每秒更新時間
let clockTimer;
onMounted(() => {
  clockTimer = setInterval(() => {
    currentTime.value = new Date().toLocaleTimeString();
  }, 1000);
});
onUnmounted(() => clearInterval(clockTimer));

// === 打字機效果 ===
const phrases = [
  "Front-End Engineer (Vue)",
  "熱愛 Javascript 的工程師",
  "把想法具現化的人",
];
const typingText = ref("");
const pIndex = ref(0);
const cIndex = ref(0);
const isDeleting = ref(false);
let typeTimer;

let typeLoop = () => {
  const current = phrases[pIndex.value];
  const full = current;

  if (!isDeleting.value) {
    // 正在打
    typingText.value = full.slice(0, cIndex.value + 1);
    cIndex.value += 1;

    if (cIndex.value === full.length) {
      // 到尾巴，稍作停頓再開始刪
      clearTimeout(typeTimer);
      typeTimer = setTimeout(() => {
        isDeleting.value = true;
        typeLoop();
      }, 1000); // 鉅偉停留 1 秒
      return;
    }
  } else {
    // 正在刪
    typingText.value = full.slice(0, cIndex.value - 1);
    cIndex.value -= 1;

    if (cIndex.value === 0) {
      // 刪完換下一句
      isDeleting.value = false;
      pIndex.value = (pIndex.value + 1) % phrases.length;
    }
  }

  // 打/刪速度
  const base = 90;
  const extra = isDeleting.value ? 0 : Math.random() * 80;
  const speed = isDeleting.value ? 60 : base + extra;

  clearTimeout(typeTimer);
  typeTimer = setTimeout(typeLoop, speed);
};

onMounted(() => {
  typeLoop();
});
onUnmounted(() => clearTimeout(typeTimer));
</script>

<template>
  <section class="home">
    <h1>嗨，我是{{ displayName }}</h1>

    <!--打字機標題-->
    <h2 class="typewriter" aria-live="polite">
      {{ typingText }}<span class="caret" aria-hidden="true"></span>
    </h2>

    <h3 v-if="showIntro" class="motto">{{ motto }}</h3>

    <p v-if="showIntro" class="intro">
      我的目標：轉戰成為 Vue 軟體工程師，這個網站是我的 Vue 作品展示。
    </p>
    <p class="time">現在時間：{{ currentTime }}</p>

    <div v-if="showIntro" class="hobbies">
      <h3>我的興趣：</h3>
      <ul>
        <li v-for="(hobby, i) in hobbies" :key="i">{{ hobby }}</li>
      </ul>
    </div>

    <button @click="toggleIntro">{{ showIntro ? "隱藏" : "顯示" }}簡介</button>
  </section>
</template>

<style scoped>
.home {
  padding: 40px 20px;
}
.typewriter {
  font-weight: 700;
  line-height: 1.4;
  min-height: 1.4rem;
  margin: 6px 0 10px;
  word-break: keep-all;
}
.caret {
  display: inline-block;
  width: 8px;
  height: 1.1rem;
  transform: translateY(2px);
  margin-left: 4px;
  background: currentColor;
  animation: blink 1s steps(1) infinite;
}
@keyframes blink {
  50% {
    opacity: 0;
  }
}
.motto {
  font-style: italic;
  color: #555;
  margin-bottom: 12px;
  text-decoration: underline;
}
.intro {
  margin-bottom: 16px;
}
.time {
  font-size: 0.9rem;
  color: #777;
  margin-bottom: 20px;
}
.hobbies ul {
  list-style: none;
  padding: 0;
}
.hobbies li {
  margin: 4px 0;
}
button {
  padding: 8px 14px;
  border: 1px solid #ccc;
  border-radius: 6px;
  background: #222;
  color: #fff;
  cursor: pointer;
}
button:hover {
  background: #444;
}
</style>
