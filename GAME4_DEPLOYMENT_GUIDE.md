# Game4 部署指南

## 概述
Game4 是 Game3 的完全独立副本，使用相同的技术栈：
- 静态资源：Cloudflare Pages
- 动态资源：Cloudflare Workers + D1 + KV

## 部署步骤

### 1. 创建 Cloudflare D1 数据库
```bash
cd worker
npm run d1:create
```
复制返回的数据库ID，更新 `wrangler.toml` 中的 `database_id`

### 2. 创建 Cloudflare KV 命名空间
```bash
npm run kv:create
```
复制返回的命名空间ID，更新 `wrangler.toml` 中的 `id`

### 3. 初始化数据库结构
```bash
npm run d1:migrate
```

### 4. 部署 Worker
```bash
npm run deploy
```

### 5. 部署静态资源到 Cloudflare Pages
1. 登录 Cloudflare Dashboard
2. 进入 Pages 服务
3. 创建新项目，选择"上传文件夹"
4. 上传整个 game4 目录（除了 worker 目录）
5. 绑定自定义域名：`game4.biboran.top`

### 6. 更新配置
- 更新 `index.html` 中的 `WORKER_BASE_URL` 为实际的 Worker URL
- 更新 `wrangler.toml` 中的 `ALLOWED_ORIGINS` 为实际的 Pages 域名

## 重要说明

### 独立资源
Game4 使用完全独立的 Cloudflare 资源：
- D1 数据库：`game4_leaderboard`
- KV 命名空间：新的命名空间
- Worker：`game4-worker`
- Pages：`game4.biboran.top`

### 不影响 Game3
Game4 的部署和运行不会影响 Game3：
- 不同的数据库
- 不同的 Worker
- 不同的域名
- 完全隔离的数据

### 域名规划
- Game3: `colortrap.biboran.top` (API: `colortrapapi.biboran.top`)
- Game4: `game4.biboran.top` (API: `game4-api.biboran.top`)

## 验证部署
1. 访问 `https://game4.biboran.top` 确认前端正常
2. 访问 `https://game4-api.biboran.top` 确认 API 正常
3. 测试登录、游戏、排行榜功能
4. 确认数据独立存储

## 故障排除
- 如果 CORS 错误，检查 `ALLOWED_ORIGINS` 配置
- 如果数据库错误，检查 `database_id` 是否正确
- 如果 KV 错误，检查 KV 命名空间 ID 是否正确

