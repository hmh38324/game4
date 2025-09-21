# Game4 部署检查清单

## 部署前检查 ✅

### 代码准备
- [x] 项目目录已创建 (`/game4/`)
- [x] 所有静态资源已复制
- [x] Worker代码已更新为game4配置
- [x] 前端代码已更新为game4配置
- [x] 配置文件已更新

### 配置更新
- [x] `index.html` 标题更新为"色彩陷阱4"
- [x] `index.html` Worker URL更新为 `https://game4-api.biboran.top`
- [x] `worker/wrangler.toml` 名称更新为 `game4-worker`
- [x] `worker/wrangler.toml` 数据库名更新为 `game4_leaderboard`
- [x] `worker/wrangler.toml` 允许域名更新为 `https://game4.biboran.top`
- [x] `worker/package.json` 名称更新为 `game4-worker`
- [x] `worker/src/index.ts` API信息更新为Game4

## 部署步骤 ⏳

### 1. Cloudflare D1 数据库
- [ ] 运行 `cd worker && npm run d1:create`
- [ ] 复制返回的数据库ID
- [ ] 更新 `wrangler.toml` 中的 `database_id`

### 2. Cloudflare KV 命名空间
- [ ] 运行 `cd worker && npm run kv:create`
- [ ] 复制返回的命名空间ID
- [ ] 更新 `wrangler.toml` 中的 `id`

### 3. 初始化数据库
- [ ] 运行 `cd worker && npm run d1:migrate`

### 4. 部署 Worker
- [ ] 运行 `cd worker && npm run deploy`
- [ ] 记录返回的Worker URL

### 5. 部署静态资源
- [ ] 登录 Cloudflare Dashboard
- [ ] 创建新的 Pages 项目
- [ ] 上传 game4 目录（除worker目录）
- [ ] 绑定域名 `game4.biboran.top`

### 6. 更新配置
- [ ] 更新 `index.html` 中的 `WORKER_BASE_URL` 为实际Worker URL
- [ ] 更新 `wrangler.toml` 中的 `ALLOWED_ORIGINS` 为实际Pages域名
- [ ] 重新部署 Worker

## 验证测试 ⏳

### 功能测试
- [ ] 访问 `https://game4.biboran.top` 确认页面正常
- [ ] 访问 `https://game4-api.biboran.top` 确认API正常
- [ ] 测试用户登录功能
- [ ] 测试游戏开始和答题功能
- [ ] 测试排行榜功能
- [ ] 测试管理员功能

### 数据隔离测试
- [ ] 确认Game4数据与Game3完全隔离
- [ ] 在Game4中创建用户数据
- [ ] 确认Game3数据不受影响
- [ ] 确认排行榜独立显示

### 性能测试
- [ ] 测试页面加载速度
- [ ] 测试API响应速度
- [ ] 测试并发用户访问

## 域名配置 ⏳

### DNS 设置
- [ ] 配置 `game4.biboran.top` A记录指向Cloudflare
- [ ] 配置 `game4-api.biboran.top` CNAME记录指向Worker
- [ ] 启用SSL证书

### 重定向设置（可选）
- [ ] 设置从旧域名到新域名的重定向
- [ ] 配置HTTPS强制重定向

## 监控和维护 ⏳

### 监控设置
- [ ] 设置页面访问监控
- [ ] 设置API响应监控
- [ ] 设置错误日志监控

### 备份策略
- [ ] 定期备份D1数据库
- [ ] 定期备份KV数据
- [ ] 设置自动备份

## 完成确认 ✅

- [ ] 所有功能正常工作
- [ ] 数据完全隔离
- [ ] 域名配置正确
- [ ] SSL证书有效
- [ ] 监控系统运行
- [ ] 文档更新完成

## 注意事项

1. **独立资源**: Game4使用完全独立的Cloudflare资源
2. **数据隔离**: 与Game3的数据完全隔离
3. **域名独立**: 使用独立的域名避免冲突
4. **配置独立**: 所有配置都需要单独维护
5. **监控独立**: 需要独立的监控和告警

## 联系信息

如有问题，请参考：
- 部署指南：`GAME4_DEPLOYMENT_GUIDE.md`
- 项目说明：`README.md`
- 对比说明：`COMPARISON.md`

