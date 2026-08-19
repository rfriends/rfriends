## RaspberryPi版rfriends3でラジオ録音（スクリプト編）    

RaspiOSのイメージにrfriends3をスクリプトによりインストールします。  
    
2026/05/14 改定  
  
<img width="600" height="450" alt="PXL_20260819_170401448 PORTRAIT~2" src="https://github.com/user-attachments/assets/70682c46-174e-4620-aa6c-63ea824c3ba2" />


    
## 1. RaspberryPi Imagerを使用してmicroSDを作成する。     

以下を参考にして、作成してください。  
  
[RaspberryPi Imagerを使用してmicroSDを作成する。](raspberrypi_sd.md)
     
  
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
  
1)2)3)のいづれかを選択してください。  
(2026/05/14)特に理由がない場合は**2)lighttpd版**を選択してください。
    
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
   $ sudo systemctl stop apache2
   $ sudo systemctl disable apache2  
```
3) debian版(apache2)  
  
```
   $ cd  ~/  
   $ rm -rf rfriends3_core  
   $ git clone https://github.com/rfriends/rfriends3_core.git  
   $ cd rfriends3_core  
   $ sh install_debian_apache2.sh  
```
  
## 6. raspberrypiを再起動する。  
  
```
   $ sudo reboot  
```
  
## 7. Webブラウザを使用してrfriendsにアクセスする。 
  
```
   http://rpi-1:8000  
   or  
   http://xxx.xxx.xxx.xxx:8000  
```  
<img width="687" height="621" alt="clip_2" src="https://github.com/user-attachments/assets/c8224f6a-c312-42f0-89b3-1ae11b407b5e" />
  
  
  
以上  
  
