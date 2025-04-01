<script setup lang="ts">
import { defineProps } from 'vue'

defineProps<{ imageUrl: string | null }>()
</script>

<template>
  <img v-if="imageUrl" :src="imageUrl" alt="Ri-Nai Avatar" class="avatar" />

</template>


<style scoped>
.avatar {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  border: 3px solid rgba(255, 255, 255, 0.8);
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
  user-select: none;
  -webkit-user-select: none;
  position: relative;
  overflow: hidden;
}

.avatar::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  border-radius: 50%;
  background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transform: translateX(-100%);
  transition: transform 0.6s;
}

.avatar:hover {
  transform: scale(1.05);
  border-color: rgba(255, 255, 255, 1);
  box-shadow: 0 0 30px rgba(100, 108, 255, 0.4);
}

.avatar:hover::before {
  transform: translateX(100%);
}

@media (prefers-color-scheme: light) {
  .avatar {
    border: 3px solid rgba(0, 0, 0, 0.8);
  }
  
  .avatar:hover {
    border-color: rgba(0, 0, 0, 1);
  }
}
</style>
