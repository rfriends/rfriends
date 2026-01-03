## RaspberryPi版rfriends3でラジオ録音（スクリプト編）    

RaspiOSのイメージにrfriends3をスクリプトによりインストールします。  
    
2025/10/03 改定  
  
## 1. 純正のimagerを使用してmicroSDを作成する。     
   <https://www.raspberrypi.com/software/>  
  
![1](https://github.com/user-attachments/assets/de69af3e-f501-40e4-b387-3901962eaaaa)  
  
### 1.1 Raspberry Pi デバイス  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W
  
### 1.2 OS  
インストールするOSを選択する。  

> [!NOTE]
> ここでは32bit版を選択していますが、64bitが可能な機種は64bitを選択しても構いません。  
> また、メモリに余裕があれば、desktop版でもOK。  
> Bullseye lite 32bit がメモリ使用量は一番少ないです。    
  
Bullseye  
  
![2](https://github.com/user-attachments/assets/2b438504-019c-4a1c-ad25-182d351ec144)  
  
Bookworm  
  
![3](https://github.com/user-attachments/assets/ca768534-6ea7-4dbe-b6d5-573911f705ae)  
  
Trixie  
  
![clip_3](https://github.com/user-attachments/assets/58299500-a77c-4236-af87-f0fbfddf0a8b)  
  
  
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
  
   ホスト名 rpios、ユーザ名 rpiの場合、  
```
   ssh rpi@rpios
```
   でアクセスできます。  
  
## 4. システムを最新にし、gitアプリをインストールする。  
  
```
   $ sudo apt-get update && sudo apt-get upgrade -y  
   $ sudo apt-get install git -y  
```
  
## 5. セットアップシェルを実行する。  
  
1)2)~~3)~~ のいづれかを選択してください。  
    
1) raspberry pi カスタマイズ版（不要なデーモンを削除し、メモリ削減）
```
   $ cd  ~/  
   $ rm -rf rfriends_raspberrypi  
   $ git clone https://github.com/rfriends/rfriends_raspberrypi.git  
   $ cd rfriends_raspberrypi  
   $ sh rfriends_raspberrypi.sh  
```
2) 通常のdebian版(lighttpd) 
```
   $ cd  ~/  
   $ rm -rf rfriends3_core  
   $ git clone https://github.com/rfriends/rfriends3_core.git  
   $ cd rfriends3_core  
   $ sh install_debian.sh  
```
3) debian版(apache)  
  
> [!CAUTION]  
> trixieの場合は、これを選択   
> 他では予約関係が動作しません。    
  
```
   $ cd  ~/  
   $ rm -rf rfriends3_core  
   $ git clone https://github.com/rfriends/rfriends3_core.git  
   $ cd rfriends3_core  
   $ sh install_debian_apache.sh  
```
  
## 6. raspberrypiを再起動する。  
  
```
   $ sudo reboot  
```
  
## 7. Webブラウザを使用してrfriendsにアクセスする。 
  
``` 
   http://xxx.xxx.xxx.xxx:8000
```  
  
  
  
以上  
  
