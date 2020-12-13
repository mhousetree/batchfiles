git add .
git commit

@echo off

rem 現在のブランチ名を取得
for /f "usebackq delims=" %%a in (`git rev-parse --abbrev-ref HEAD`) do set branch=%%a

echo *********************************************************
echo 現在のブランチは %branch% です。

rem 現在のブランチがmasterかどうかでpush先を変える
if "%branch%" == "master" (
    echo GitHubの %branch% ブランチにデプロイします
    echo *********************************************************
    git push origin master
    echo *********************************************************
    echo Herokuにデプロイします
    echo *********************************************************
    git push heroku master
) else (
    echo GitHubの %branch% ブランチにデプロイします
    echo *********************************************************
    git push origin %branch%
    echo *********************************************************
    echo %branch% ブランチからHerokuにデプロイします
    echo *********************************************************
    git push heroku %branch%:master
)
rem 終了通知音を鳴らす
powershell -NoProfile -ExecutionPolicy Unrestricted play_sounds/play_finish.ps1