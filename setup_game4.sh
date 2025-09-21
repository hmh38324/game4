#!/bin/bash

# Game4 快速设置脚本
echo "🚀 开始设置 Game4..."

# 检查是否在正确的目录
if [ ! -f "worker/package.json" ]; then
    echo "❌ 错误：请在game4根目录下运行此脚本"
    exit 1
fi

# 进入worker目录
cd worker

echo "📦 安装依赖..."
npm install

echo "🗄️ 创建D1数据库..."
echo "请复制返回的数据库ID，然后更新wrangler.toml中的database_id"
npm run d1:create

echo ""
echo "💾 创建KV命名空间..."
echo "请复制返回的命名空间ID，然后更新wrangler.toml中的id"
npm run kv:create

echo ""
echo "📋 初始化数据库结构..."
npm run d1:migrate

echo ""
echo "🚀 部署Worker..."
npm run deploy

echo ""
echo "✅ Worker部署完成！"
echo ""
echo "📝 接下来的步骤："
echo "1. 更新wrangler.toml中的database_id和KV id（使用上面返回的ID）"
echo "2. 重新运行: npm run deploy"
echo "3. 将整个game4目录部署到Cloudflare Pages"
echo "4. 绑定自定义域名: game4.biboran.top"
echo "5. 更新index.html中的WORKER_BASE_URL为实际的Worker URL"
echo "6. 更新wrangler.toml中的ALLOWED_ORIGINS为实际的Pages域名"
echo ""
echo "🎮 Game4设置完成！"
echo "📖 详细说明请查看: GAME4_DEPLOYMENT_GUIDE.md"


