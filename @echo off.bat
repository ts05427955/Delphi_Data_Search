@echo off
cd C:\Users\Marco.ma\Documents\Embarcadero\Studio\Case1

REM 記錄開始時間
echo Starting auto git push at %date% %time% >> git_auto_log.txt


REM 檢查並移除已存在的遠端倉庫設定
REM git remote remove origin

REM 重新添加遠端倉庫
REM git remote add origin https://github.com/Marco-ma-CSM/Marco-ma-CSM-CSM-Test.git

REM 添加所有變更
git add .

REM 提交變更
git commit -m "Daily auto commit %date% %time%"

REM 推送到 master 分支
git push origin master

REM 記錄完成狀態
if %errorlevel% equ 0 (
    echo Push completed successfully >> git_auto_log.txt
) else (
    echo Push failed with error code %errorlevel% >> git_auto_log.txt
)

REM git remote -v

REM git config --global credential.helper store