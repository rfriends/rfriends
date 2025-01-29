## rfriends3 for RaspebrryPiの使用方法（スクリプト編）    
  
## 1. 純正のimagerを使用してmicroSDを作成する。     
   https://www.raspberrypi.com/software/  
  
![clip_11](https://github.com/user-attachments/assets/5645a43a-3e0b-49f2-84c4-ef7516cd6017)

  
### 1.1 Raspberry Pi デバイス  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W
  
### 1.2 OS  
インストールするOSを選択
  
Bullseye  
![bbulls](https://github.com/user-attachments/assets/b70bfbd6-53d4-4ff8-9e96-c73969b3fde8)
  
Bookworm  
![book](https://github.com/user-attachments/assets/8fe74637-4cb6-44ca-863d-e07c685ab105)
  
### 1.3 ストレージ  
セットしているmicroSDを選択  
  
> [!CAUTION]
> これを間違えると、ほかのデバイスにOSを書き込んでしまいます。
  
### 1.4 設定を編集する  
  
・一般   
> [!NOTE]
> ホスト名、ユーザ名、SSID、パスワードは環境に合わせて設定する。   

![clip_10](https://github.com/user-attachments/assets/a146fc38-f61e-4683-9501-2f3628dc3cd6)


・サービス  
SSHを有効化する  
  
 
## 2. microSDをraspberrypiにセットし起動する。   
   初回起動時は領域拡張を行うのでmicroSDのサイズによっては時間がかかります。    
   緑のランプが点滅から点灯になるのを待ってください。  
## 3. sshでraspberrypiにアクセスする。  
   ホスト名 rpi-1、ユーザ名 rpiの場合、  
```
   ssh rpi@rpi-1
```
   でアクセスできます。  
## 4. システムを最新にし、gitアプリをインストールする。  
```
   $ sudo apt-get update && sudo apt-get upgrade -y  
   $ sudo apt-get install git -y  
```
## 5. セットアップシェルを実行する。  
```
   $ cd  ~/  
   $ rm -rf rfriends_raspberrypi  
   $ git clone https://github.com/rfriends/rfriends_raspberrypi.git  
   $ cd rfriends_raspberrypi  
   $ sh rfriends_raspberrypi.sh  
```
## 6. raspberrypiを再起動する。  
```
   $ sudo reboot  
```
## 7. Webブラウザを使用してrfriendsにアクセスする。 
``` 
   http://xxx.xxx.xxx.xxx:8000
```
