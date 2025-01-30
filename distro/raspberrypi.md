## RaspebrryPi版rfriends3でラジオ録音（スクリプト編）    

RaspiOSのイメージにrfriends3をスクリプトによりインストールします。  
  
## 1. 純正のimagerを使用してmicroSDを作成する。     
   <https://www.raspberrypi.com/software/>  
  
![1](https://github.com/user-attachments/assets/de69af3e-f501-40e4-b387-3901962eaaaa)  
  
### 1.1 Raspberry Pi デバイス  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W
  
### 1.2 OS  
インストールするOSを選択
  
Bullseye  
  
![2](https://github.com/user-attachments/assets/2b438504-019c-4a1c-ad25-182d351ec144)  
  
Bookworm  
  
![3](https://github.com/user-attachments/assets/ca768534-6ea7-4dbe-b6d5-573911f705ae)  
  
### 1.3 ストレージ  
セットしているmicroSDを選択  
  
> [!CAUTION]
> これを間違えると、ほかのデバイスにOSを書き込んでしまいます。
  
### 1.4 設定を編集する  
  
・一般   
> [!NOTE]
> ホスト名、ユーザ名、SSID、パスワードは環境に合わせて設定する。    
  
![4](https://github.com/user-attachments/assets/1cbbfbe0-d869-486c-8f34-7bf8ad3b3609)
  
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
