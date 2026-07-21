## Apple Container版rfriends3でラジオ録音  
   
　ラジオ録音アプリrfriends3をApple Container環境で実行する方法について記述しています。  
  
初版 2026/07/21  
  
> [!NOTE]  
> 現在、書きかけです。
  
  
## １．Apple Container環境構築   
  
### 1.1 インストール   
  
```
% brew install container

ロゼッタを使用しない設定
% mkdir -p ~/.config/container
% echo "[build]\nrosetta = false" >> ~/.config/container/config.toml
```  
### 1.2 確認  
```  
% container system start
% container run --rm hello-world
```
   
## ２．実行  
  
イメージの作成から実行まではTerminal上で以下の操作を行ってください。  
 
### 2.1 スクリプトのダウンロード  
  
```
% cd ~/  
% brew install git  
% rm -rf rfriends_docker  
% git clone https://github.com/rfriends/rfriends_docker.git  
```
 
### 2.2 uid,gidの変更をおこなう。  

1） uid,gid  

macの場合、uid=501(user) gid=20(staff)
  
2）Dockerファイルを修正する。  
  
```
cd ~/rfriends_docker  
vi Dockerfile  
```
   
Dockerfileのuid,gidを設定してください。  
uid,gidは1）で表示されたものを指定してください。  
  
ENV uid=501  
ENV gid=20    
  
### 2.3 イメージの作成および実行を行う。  
  
```
% cd ~/rfriends_docker
% container build --platform linux/arm64 -t rfriends3 .
% sh run_apple_container.sh
  
rfriendsが使用できます。  
```
  
と表示されたら成功です。  
  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
```   
% hostname -I  
192.168.1.142 ..........  
```
  
ホストののIPアドレスが192.168.1.142の場合、ブラウザに
```
http://192.168.1.142:8000
```
と入力するとrfriends3が表示されます。
 
> [!TIP]   
> 同一LAN内の他のPCからもアクセスできます。  
    
## ３．その他  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config  

  
以上  
  
  
  
