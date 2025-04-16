<script setup lang="ts">

import { defineProps, ref, onMounted } from 'vue'

const props = defineProps<{
  imageUrl: string | null
  title: string | null
  url: string | null
}>()

const svgContent = ref<string | null>(null)

onMounted(async () => {
  if (props.imageUrl?.includes('svg')) {
    const response = await fetch(props.imageUrl)
    svgContent.value = await response.text()
  }
})

</script>

<template>
  <a :href="url || ''" :title="title || ''">
    <div class="menu-button">
      <template v-if="!imageUrl?.includes('null')">
        <div v-if="imageUrl?.includes('svg')" class="menu-button-icon" v-html="svgContent" />
        <div v-else class="menu-button-icon">
          <img :src="imageUrl || ''" alt="icon" />
        </div>
      </template>
      <span class="menu-button-title">{{ title }}</span>
    </div>
  </a>
</template>

<style scoped>
.menu-button {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 8em;
  margin: 0.5em;
  padding: 0.8em;
  border-radius: 1em;
  background: rgba(255, 255, 255, 0.1);
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
  backdrop-filter: blur(10px);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  text-decoration: none;
  position: relative;
  overflow: hidden;
}

.menu-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
  transform: translateX(-100%);
  transition: transform 0.6s;
}

.menu-button:hover {
  transform: translateY(-3px);
  background: rgba(255, 255, 255, 0.15);
  box-shadow: 0 0 20px rgba(255, 255, 255, 0.3);
}

.menu-button:hover::before {
  transform: translateX(100%);
}

.menu-button-title {
  flex: 1;
  text-align: center;
  font-size: 1.1em;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.9);
  user-select: none;
  -webkit-user-select: none;
  transition: color 0.3s ease;
}

.menu-button:hover .menu-button-title {
  color: aqua;
}

.menu-button-icon {
  width: 1.8em;
  height: 1.8em;
  margin-right: 0.8em;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.3s ease;
}

.menu-button:hover .menu-button-icon {
  transform: scale(1.1);
}

.menu-button-icon img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.menu-button-icon :deep(svg) {
  width: 100%;
  height: 100%;
  /* fill: currentColor; */
  transition: 0.3s ease;
}

.menu-button:hover .menu-button-icon :deep(svg) {
  color: aqua;
}

@media (prefers-color-scheme: light) {
  .menu-button {
    background: rgba(0, 0, 0, 0.1);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  }

  .menu-button:hover {
    background: rgba(0, 0, 0, 0.15);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
  }

  .menu-button-title {
    color: rgba(241, 235, 235, 0.8);
  }

  .menu-button:hover .menu-button-title {
    color: inherit;
  }

  .menu-button:hover .menu-button-icon :deep(svg) {
    color: inherit;
  }
}
</style>
