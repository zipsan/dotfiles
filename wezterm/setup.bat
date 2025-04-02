@echo off
chcp 65001 > nul
setlocal

REM --- 静的なパス設定 ---
REM %~dp0 はこのバッチファイルが存在するディレクトリのパス (末尾に \ が付きます)
set "TARGET_FILE=%~dp0wezterm.lua"
set "LINK_PATH=%USERPROFILE%\.wezterm.lua"

echo --- wezterm.lua シンボリックリンク作成 ---
echo ターゲット: "%TARGET_FILE%"
echo リンク先  : "%LINK_PATH%"
echo.

REM --- ターゲットファイルの存在確認 ---
if not exist "%TARGET_FILE%" (
    echo エラー: ターゲットファイルが見つかりません。
    echo "%TARGET_FILE%"
    echo このバッチファイルは git clone したリポジトリのルートディレクトリに置いて実行する必要があります。
    pause
    exit /b 1
)

REM --- 既存のリンク/ファイルがあれば削除 ---
if exist "%LINK_PATH%" (
    echo 既存のファイルを削除しています: "%LINK_PATH%"
    REM 念のためファイルとディレクトリ両方の削除を試みる
    del "%LINK_PATH%" /f /q > nul 2>&1
    rd "%LINK_PATH%" /s /q > nul 2>&1
)

REM --- シンボリックリンクの作成 ---
echo シンボリックリンクを作成中...
mklink "%LINK_PATH%" "%TARGET_FILE%"

REM --- 結果確認 ---
if %ERRORLEVEL% equ 0 (
    echo シンボリックリンクの作成に成功しました。
) else (
    echo シンボリックリンクの作成に失敗しました。 エラーコード: %ERRORLEVEL%
    echo !!! 注意: このスクリプトは開発者モード無効時は管理者権限で実行する必要があります !!! 
    pause
    exit /b %ERRORLEVEL%
)

echo 完了。
pause
exit /b 0

endlocal