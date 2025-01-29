## Docker Engine   
   
　ubuntuにDocker Engine, Composeをインストールして実行する。
  
![Screenshot from 2025-01-19 06-43-11](https://github.com/user-attachments/assets/f2e75770-578f-4245-880b-f798a430c0f3)

## １．Docker Enginee, Composeのインストール  
  
```
sudo apt update && sudo apt install curl -y  
curl https://get.docker.com | sudo sh  
sudo chmod 666 /var/run/docker.sock  
```  
確認  
```  
$ docker --version  
Docker version 27.5.0, build a187fa5  
  
$ docker compose version  
Docker Compose version v2.32.4
```  
     
## ２．実行  
  
　Dockerイメージの作成から実行まではTerminal上で以下の操作を行ってください。  
　
### 2.1 rfriends_docker.gitをクローンする。  
  
```
cd ~/
rm -rf rfriends_docker
git clone https://github.com/rfriends/rfriends_docker.git   
```
 
### 2.2 uid,gidの変更をおこなう。  
  
**通常は修正の必要はありません。**  
  
１）ホストでidを実行する。 
```
id  
```
uid=1000(user) gid=1000(user)
  
２）Dockerファイルを修正する。  
  
```
cd rfriends_docker  
vi Dockerfile  
```
   
Dockerfileのuid,gidを設定してください。  
ENV uid=1000  
ENV gid=1000    
  
### 2.3 イメージの作成および実行を行う。  
  
```  
docker compose up  
...  
  
rfriendsが使用できます。  
```
  
と表示されたら成功です。  
  
> [!TIP]
> "permission denied"のエラーが出る場合は以下を試してみてください。   
> sudo chmod 666 /var/run/docker.sock  
  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
```
$ hostname -I
192.168.1.142 ..........  
```
  
ホストののIPアドレスが192.168.1.142の場合、
```
http://192.168.1.142:8000
```
と入力するとrfriends3が表示されます。
 
> [!TIP]   
> 同一LAN内の他のPCからもアクセスできます。  
    
### 2.5 終了  
```
Terminalでctl-cを3回入力してコンテナを終了させてください。
```
  
終了すると、rfriends3の実行も終了するため、Webアクセスはできなくなります。  
      
以上  
  
  
  

