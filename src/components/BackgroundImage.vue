<script setup lang="ts">
defineProps<{ imageUrl: string | null }>()
</script>

<template>
  <div v-if="imageUrl" class="background-container" :style="{ backgroundImage: `url(${imageUrl})` }">
  </div>
</template>

<style scoped>
.background-container {
  width: 100%;
  height: 100vh;
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-repeat: no-repeat;
  position: fixed;
  text-align: center;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0;
  /* 初始透明度为0 */
  animation: fadeIn 1s ease-in forwards;
  /* 添加1秒的淡入动画 */
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

.background-container::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(1px);
  -webkit-backdrop-filter: blur(1px);
}

@media (prefers-color-scheme: light) {
  .background-container::after {
    background-color: rgba(255, 255, 255, 0.2);
  }
}
</style>
