git add .
git commit

@echo off

rem ���݂̃u�����`�����擾
for /f "usebackq delims=" %%a in (`git rev-parse --abbrev-ref HEAD`) do set branch=%%a

echo *********************************************************
echo ���݂̃u�����`�� %branch% �ł��B

rem ���݂̃u�����`��master���ǂ�����push���ς���
if "%branch%" == "master" (
    echo GitHub�� %branch% �u�����`�Ƀf�v���C���܂�
    echo *********************************************************
    git push origin master
    echo *********************************************************
    echo Heroku�Ƀf�v���C���܂�
    echo *********************************************************
    git push heroku master
) else (
    echo GitHub�� %branch% �u�����`�Ƀf�v���C���܂�
    echo *********************************************************
    git push origin %branch%
    echo *********************************************************
    echo %branch% �u�����`����Heroku�Ƀf�v���C���܂�
    echo *********************************************************
    git push heroku %branch%:master
)
rem �I���ʒm����炷
powershell -NoProfile -ExecutionPolicy Unrestricted play_sounds/play_finish.ps1