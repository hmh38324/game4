# 色彩陷阱游戏4 (Game4)

## 项目说明
Game4 是 Game3 的完全独立副本，具有相同的功能和界面，但使用独立的 Cloudflare 资源。

## 技术栈
- **前端**: HTML5 + CSS3 + JavaScript (纯静态)
- **后端**: Cloudflare Workers
- **数据库**: Cloudflare D1 (SQLite)
- **缓存**: Cloudflare KV
- **部署**: Cloudflare Pages

## 功能特性
- 🎨 色彩陷阱游戏逻辑
- 👤 用户登录系统
- 🏆 排行榜功能
- ⏱️ 计时系统
- 📊 每日限制（每人每天最多3次）
- 🔧 管理员功能

## 快速开始

### 1. 自动设置（推荐）
```bash
./setup_game4.sh
```

### 2. 手动设置
详细步骤请查看 [GAME4_DEPLOYMENT_GUIDE.md](./GAME4_DEPLOYMENT_GUIDE.md)

## 项目结构
```
game4/
├── index.html              # 主页面
├── people.json             # 用户数据
├── daily_limit_data.json   # 每日限制数据
├── worker/                 # Cloudflare Worker
│   ├── src/index.ts       # Worker 源代码
│   ├── schema.sql         # 数据库结构
│   ├── wrangler.toml      # Worker 配置
│   └── package.json       # 依赖配置
├── card_backgrounds/       # 卡片背景图片
├── pic/                   # 游戏图片资源
├── split_images/          # 分割后的图片
└── deploy.sh              # 部署脚本
```

## 与 Game3 的关系

### 相同点
- 完全相同的游戏逻辑和界面
- 相同的技术栈和架构
- 相同的功能特性

### 不同点
- **独立的域名**: `game4.biboran.top` vs `colortrap.biboran.top`
- **独立的数据库**: `game4_leaderboard` vs `game3_leaderboard`
- **独立的 Worker**: `game4-worker` vs `game3-worker`
- **独立的数据**: 排行榜、用户数据完全隔离

### 为什么需要 Game4？
- 可以同时运行多个游戏实例
- 数据完全隔离，互不影响
- 便于A/B测试或不同版本对比
- 满足不同用户群体的需求

## 部署状态
- ✅ 代码准备完成
- ⏳ 等待 Cloudflare 资源创建
- ⏳ 等待域名配置
- ⏳ 等待最终测试

## 注意事项
1. Game4 和 Game3 使用完全独立的资源，互不影响
2. 需要为 Game4 创建新的 Cloudflare D1 数据库和 KV 命名空间
3. 需要配置新的域名或子域名
4. 所有配置都需要更新为 Game4 相关的值

## 支持
如有问题，请查看部署指南或联系开发者。