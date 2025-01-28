@echo off
setlocal enabledelayedexpansion
rem -----------------------------------------
rem rfriends3 簡易インストーラー
rem
rem 2023/06/19 by mapi
rem 2024/12/14 by mapi
rem -----------------------------------------
echo rfriends3インストーラー for windows Ver. 1.40
echo.
echo rfriends3をダウンロードし解凍します。
echo ウェブサーバを起動中の場合は、必ず終了させてください。
echo.

set /p ans="処理を開始しますか　(y/n) ?"
if /i "%ans%"=="y" goto ex1
echo 処理を中止します。
goto stp
:ex1
rem -----------------------------------------
rem 開始
rem
echo.

set dir1=http://rfbuddy.s296.xrea.com/storage/
set dir2=http://ceres.s501.xrea.com/storage/
set dir3=http://rfriends.s1009.xrea.com/storage/
set file=rfriends3_latest_full_x64.zip

del %file% /Q > nul 2>&1
rem -----------------------------------------
rem ファイルの存在チェック
rem
set url=%dir1%%file%
for /f %%i in ('curl -k -s -I -o nul -w "%%{http_code}" %url%') do set http_code=%%i
if %http_code% equ 200 goto ok
echo not exist (%http_code%) %url%

rem since dir1 only
goto skp

set url=%dir2%%file%
for /f %%i in ('curl -k -s -I -o nul -w "%%{http_code}" %url%') do set http_code=%%i
if %http_code% equ 200 goto ok
echo not exist (%http_code%) %url%

set url=%dir3%%file%
for /f %%i in ('curl -k -s -I -o nul -w "%%{http_code}" %url%') do set http_code=%%i
if %http_code% equ 200 goto ok
echo not exist (%http_code%) %url%

:skp
echo ファイルのダウンロードに失敗しました。
goto stp

:ok
rem -----------------------------------------
rem ファイルダウンロード
rem
echo exist %url%
echo.
curl %url% --output %file%

echo.
echo downloaded
echo.
rem -----------------------------------------
rem ファイルの展開
rem
tar -xf %file%
echo unzipped
echo.
del %file% /Q
rem -----------------------------------------
rem rf3serverのショートカット作成
rem
cd rfriends3
cscript rf3server.vbs
copy /Y rf3server.lnk "%USERPROFILE%\DESKTOP\"

rem echo [InternetShortcut]> rfriends3.url
rem echo URL="http://localhost:8000">> rfriends3.url
rem copy /Y rfriends3.url "%USERPROFILE%\DESKTOP\"

:stp
rem -----------------------------------------
rem 終了
rem
pause
