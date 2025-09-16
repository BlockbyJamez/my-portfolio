@echo off
echo ================================
echo ?? �}�l���p my-portfolio
echo ================================

REM Step 1: ���]�M��
echo [1/3] ���� npm run build...
call npm run build

REM Step 2: ���e��l�X�� main
echo [2/3] ����ñ��e main ����...
git add .
set /p msg=�п�J commit �T�� (�w�]: chore: update source): 
if "%msg%"=="" set msg=chore: update source
git commit -m "%msg%"
git push origin main

REM Step 3: ���e dist �� gh-pages
echo [3/3] ���e dist �� gh-pages...
git subtree push --prefix dist origin gh-pages

echo ================================
echo ? ���p�����I
echo ������s��i��: https://blockbyjamez.github.io/my-portfolio/
echo ================================

pause
