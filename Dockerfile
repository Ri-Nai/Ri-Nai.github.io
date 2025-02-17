# 使用 Node 作为构建环境
FROM node:18-alpine AS builder
WORKDIR /app
# 复制 package.json 和 pnpm-lock.yaml（如果有的话）
COPY package*.json ./
# 安装 pnpm 并安装依赖
RUN npm install -g pnpm && pnpm install
# 复制所有源代码
COPY . .
# 进行生产环境构建（构建后生成 dist 文件夹，注意构建命令根据项目配置可能不同）
RUN pnpm build

# 使用 Nginx 来托管静态文件
FROM nginx:stable-alpine
# 将构建产物复制到 Nginx 默认托管目录
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
