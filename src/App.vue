<script setup lang="ts">
import { ref } from 'vue'

// import config from './config'
import yaml from 'js-yaml'
import configText from './config.yaml?raw'

const config: any = yaml.load(configText)

// 定义 reactive 数据
// 使用 import.meta.glob 动态导入所有图片
const images: Record<string, { default: string }> = import.meta.glob(['./assets/*', './assets/icons/*'], { eager: true });

for (const path in images) {
  console.log(`Image path: ${path}`, images[path].default);
}

const bgUrl = ref<string | null>(null)
const avatarUrl = ref<string | null>(null)

// 修改图片加载逻辑
if (config.background) {
  const bgPath = config.background.replace('./', '')
  bgUrl.value = images[`./${bgPath}`]?.default || ''
  console.log('Background URL:', bgUrl.value)
}

if (config.avatar) {
  const avatarPath = config.avatar.replace('./', '')
  avatarUrl.value = images[`./${avatarPath}`]?.default || ''
  console.log('Avatar URL:', avatarUrl.value)
}

for (const item of config.menu) {
  if (item.icon) {
    const iconPath = item.icon.replace('./', '')
    item.icon = images[`./${iconPath}`]?.default || ''
  }
}

console.log('config:', config)

import BackgroundImage from './components/BackgroundImage.vue'
import Ri_NaiAvatar from './components/Ri-NaiAvatar.vue'
import FadeIn from './components/FadeIn.vue'
import PersonalMenu from './components/PersonalMenu.vue'
</script>

<template>
  <BackgroundImage :imageUrl="bgUrl" />
  <FadeIn>
    <Ri_NaiAvatar :imageUrl="avatarUrl" />
    <div class="text-content">
      <h2 class="name">Reina</h2>
      <h4 class="motto">如果努力的尽头就是奇迹</h4>
    </div>
    <PersonalMenu :items="config.menu" />
  </FadeIn>
</template>


<style scoped>
.text-content {
  text-align: center;
  margin: 1.5rem 0;
  font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
}

.name {
  font-size: 3.5rem;
  font-weight: 600;
  margin: 0;
  background: linear-gradient(45deg, #646cff, #42b883);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradient 8s ease infinite;
  text-shadow: 
    0 0 1px rgba(255, 255, 255, 0.1),
    0 0 2px rgba(255, 255, 255, 0.1),
    0 0 4px rgba(255, 255, 255, 0.1),
    0 0 8px rgba(255, 255, 255, 0.1),
    0 0 16px rgba(255, 255, 255, 0.1);
  letter-spacing: 1px;
  font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
  position: relative;
}

.name::after {
  content: 'Reina';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(45deg, #646cff, #42b883);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradient 8s ease infinite;
  filter: blur(8px);
  opacity: 0.5;
  z-index: -1;
}

.motto {
  font-size: 1.3rem;
  color: rgba(255, 255, 255, 0.9);
  margin: 0.8rem 0;
  font-weight: 300;
  text-shadow: 
    0 0 1px rgba(0, 0, 0, 0.1),
    0 0 2px rgba(0, 0, 0, 0.1),
    0 0 4px rgba(0, 0, 0, 0.1);
  letter-spacing: 2px;
  font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
  position: relative;
}

.motto::after {
  content: '如果努力的尽头就是奇迹';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  color: rgba(255, 255, 255, 0.3);
  text-shadow: none;
  z-index: -1;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

@media (prefers-color-scheme: light) {
  .motto {
    color: rgba(0, 0, 0, 0.8);
  }
  
  .motto::after {
    color: rgba(0, 0, 0, 0.1);
  }
}

@media (max-width: 768px) {
  .name {
    font-size: 2.8rem;
  }
  
  .motto {
    font-size: 1.1rem;
    letter-spacing: 1px;
  }
}
</style>
