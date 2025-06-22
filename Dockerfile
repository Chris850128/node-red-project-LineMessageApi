# 使用 Node-RED 官方建議的 Node.js LTS 基礎映像
FROM node:18-bullseye

# 建立工作目錄
WORKDIR /usr/src/node-red

# 安裝 Node-RED 與需要的工具
RUN npm install -g --unsafe-perm node-red

# 可選：預裝常用節點（例如 dashboard）
# RUN npm install node-red-dashboard
# 安裝 Node-RED 核心
RUN npm install -g --unsafe-perm node-red

# 建立持久化資料夾
VOLUME ["/data"]

# 設定環境變數（啟用專案功能並設置使用者資料目錄）
ENV NODE_RED_ENABLE_PROJECTS=true \
    NODE_RED_HOME=/usr/src/node-red \
    NODE_RED_USER_DIR=/data \
    FLOWS=flows.json

# 設定容器內部監聽埠
EXPOSE 1880

# 啟動 Node-RED
CMD ["node-red", "--userDir", "/data"]
