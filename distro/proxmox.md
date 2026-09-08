# Proxmox版コンテナを作成してrfriends3でラジオ録音  
  
Proxmox VEユーザで、コンテナの作成経験のある方を対象としています。  
  
<img width="400"  alt="clip_13" src="https://github.com/user-attachments/assets/aeeb7d91-42e1-4272-b4a0-6f46ae0218c6" />  
  
初版 2026/09/07  
改版 2026/09/07  
  
## １．コンテナを作成する。  
  
ここでは、ubuntu24.04のtemplateを使用しています。  
設定は以下の画面を参考にしてください。  
  
<img width="777" height="583" alt="clip_11" src="https://github.com/user-attachments/assets/355bac03-2696-463e-90aa-099f61ba2a04" />  
  
  
## ２．実行ユーザを追加する。  
  
#### 1 ) コンテナを起動し、rootでログインする。    

#### 2 ) システムをupdateし、アプリを追加する。      
  
```
apt update
apt install curl git -y
```  
  
#### 3 ) 実行するユーザを追加し、管理者権限を付加する。  
  
ここでは、ユーザ名を仮に、rf3userとしています。  
  
```  
useradd -m -G sudo rf3user  
passwd rf3user  
chsh -s /bin/bash rf3user   
```  
  
## ３．rfriends3のダウンロードとインストールを行う。  
  
#### 1 ) 一旦ログアウトし、rf3userでログインする。  
  
#### 2 ) rfriends3のインストールを行う。  
  
```  
curl -LO rfriends.github.io/ubuntu.sh
sh ubuntu.sh
```  
  
#### 3 ) 再起動する。  
  
```  
sudo reboot  
```  
  
## ４．rfriends3の実行  
  
#### 1 ) NetworkメニューでIPアドレスを確認する。  
  
#### 2 ) ウェブブラウザ（edge,chrome,firefox,…）を起動し、確認したアドレスにアクセスする。  
  
http://XXX.XXX.XXX.XXX:8000  
または  
http://hostname:8000  
  
#### 3 ) 以下のような画面が出たら成功です。  
  
<img width="502" height="622" alt="clip_10" src="https://github.com/user-attachments/assets/5c37a5eb-a97d-4fd7-a39e-b64b3ec0f40d" />  

  
ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
以上  
