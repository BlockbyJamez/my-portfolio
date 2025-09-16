@echo off
echo ================================
echo 🚀 開始部署 my-portfolio
echo ================================

REM Step 1: 打包專案
echo [1/3] 執行 npm run build...
npm run build

REM Step 2: 推送原始碼到 main
echo [2/3] 提交並推送 main 分支...
git add .
git commit -m "chore: update source"
git push origin main

REM Step 3: 推送 dist 到 gh-pages
echo [3/3] 推送 dist 到 gh-pages...
git subtree push --prefix dist origin gh-pages

echo ================================
echo ✅ 部署完成！
echo 網站更新後可至: https://blockbyjamez.github.io/my-portfolio/
echo ================================

pause
