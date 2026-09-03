## Genymobile scrcpyでtermuxを簡単インストール  
  
scrcpyはandroid端末をパソコンから操作できるアプリです。  

<img width="600" height="600" alt="PXL_20260903_055323583~2" src="https://github.com/user-attachments/assets/6d4a9ff1-3dfb-4eb8-b496-a8a27de750ef" />

    
ここでは、KYF42といういわゆるガラホにtermuxをインストールする例を紹介します。  
ほかのandroid端末でも同様に可能です。  
  
ここでは、以下  
Windows PC -> PC  
KYF42 -> 端末  
と呼びます。  

  
初版 2026/09/03  

  
### １．準備  
  
用意するもの以下の３つ。  
  
PC : Windows PC  
端末 : au KYF42 GRATINA  
Type-C ケーブル  
  
  
### ２．ダウンロード  
  
PCでgithubより以下の2つをダウンロードする。  
  
Genymobile scrcpy  
[scrcpy-win64-v4.1.zip](https://github.com/Genymobile/scrcpy/releases/download/v4.1/scrcpy-win64-v4.1.zip)  
  
termux termux-app  
[termux-app_v0.119.0-beta.3+apt-android-7-github-debug_armeabi-v7a.apk](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.3/termux-app_v0.119.0-beta.3+apt-android-7-github-debug_armeabi-v7a.apk)  
  
scrcpy-win64-v4.1.zipを解凍する。  
C:\Users\user\Downloads\scrcpy-win64-v4.1\scrcpy-win64-v4.1  
  
ダウンロードしたtermux.apkをPCの"adb.exe"と同じフォルダコピーする。  
termux-app_v0.119.0-beta.3+apt-android-7-github-debug_armeabi-v7a.apk  

<img width="667" height="618" alt="clip_27" src="https://github.com/user-attachments/assets/bb364f4f-3c22-4351-9425-c9a33b8ee040" />
  
  
### ３．端末のusbデバッグを有効  
  
設定 - その他の設定 - 端末情報 - ビルド番号  
決定ボタンを7回押して開発者オプションを有効にする。  
  
設定 - その他の設定 - 端末情報 - 開発者オプション  
スリープモードにしないを有効  
usbデバッグを有効  
  
### ４．端末をPCに接続  
  
Type-C ケーブルで、端末をPCに接続する。  
  
端末に表示される  
ファイル転送を有効にする  
  
  
### ５．adbの実行  
  
PCで  
  
scrcpy-win64-v4.1を開き、  
open_a_terminal_here.batをダブルクリックする。  
CMD画面が開くので、adb devices と入力する。  
unauthorized　で認識されていない。  
  
```  
Microsoft Windows [Version 10.0.26100.4351]  
(c) Microsoft Corporation. All rights reserved.  
  
adb devices  
  
C:\Users\user\Downloads\scrcpy-win64-v4.1\scrcpy-win64-v4.1>adb devices  
* daemon not running; starting now at tcp:5037  
* daemon started successfully  
List of devices attached  
661722170316    unauthorized  
```  
端末に表示される  
  
USBデバッグを常に許可するにチェック  
USBデバッグを許可しますかを許可  
  
もう一度、adb devicesと入力すると、端末が認識される。  
  
```  
adb devices  
  
C:\Users\user\Downloads\scrcpy-win64-v4.1\scrcpy-win64-v4.1>adb devices  
List of devices attached  
661722170316    device  
```  
  
### ６．termuxのインストール  
  
adbの画面で  
adb installでtermuxをインストールする。  
  
```  
adb install termux-app_v0.118.3+github-debug_armeabi-v7a.apk  
  
Performing Streamed Install  
Success  
```  
  
### ７．scrcpyで端末を操作  
  
PCでscrcpy.exeをダブルクリックすると、以下のような画面が出力される。  
  
```  
scrcpy 4.1 <https://github.com/Genymobile/scrcpy>  
INFO: ADB device found:  
INFO:     -->   (usb)  661722170316                    device  KYF42  
C:\Users\user\Downloads\scrcpy-win64-v4.1\scrcpy-win64-v4....file pushed, 0 skipped. 53.7 MB/s (733706 bytes in 0.013s)  
[server] INFO: Device: [KYOCERA] KYOCERA KYF42 (Android 10)  
[server] WARN: Audio disabled: it is not supported before Android 11  
INFO: Renderer: direct3d11  
WARN: Demuxer 'audio': stream explicitly disabled by the device  
INFO: Texture: 480x854  
```  
  
同時に、接続している端末の画面が表示され、PCからリモートで操作できるようになる。  
  
  
これ以降は、端末の慣れない入力から解放され、PCで自由に操作できます。  

<img width="482" height="886" alt="clip_25" src="https://github.com/user-attachments/assets/7d08817f-ab5f-4f52-bd8b-86c8f64b9fcf" />

  
### ８．その他  
  
以下を参考にTermux版rfriends3をインストールしてみてください。  
  
Termux版rfriends3でラジオ録音  
https://rfriends.github.io/rfriends/distro/termux.html  

ガタホで、ラジオ録音の完成です。  
  
以上  
