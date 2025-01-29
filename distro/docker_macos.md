
## Docker Desktop for macOS   
   
　macにDocker Desktopをインストールして実行する。
  
![mac](https://github.com/user-attachments/assets/4859ae25-4a94-463e-a7fd-7826085fa1ea)

## １．Docker Desktopのインストール  
  
以下のサイトを参考にインストールしてください。  
公式のサイトからdmgファイルをダウンロードしてインストールするだけです。  
  
Mac に Docker Desktop をインストール  
https://docs.docker.jp/docker-for-mac/install.html  
  
## ２．実行  
  
　Dockerイメージの作成から実行まではTerminal上で以下の操作を行ってください。  
　
### 2.1 rfriends_docker.gitをクローンする。  
  
```
cd ~/
rm -rf rfriends_docker
git clone https://github.com/rfriends/rfriends_docker.git   
```
 
### 2.2 Dockerfileを変更する。

１）ホストでidを実行する。 
```
id  
```
uid=501(user) gid=20(staff)
  
２）Dockerファイルを修正する。  
  
> [!CAUTION]  
> この修正をしなくても動作は可能ですが、shareディレクトリ内のファイルの修正はできません。  
  
```
cd rfriends_docker  
Dockerfileの修正  
```
   
Dockerfileのuid,gidを設定してください。  
ENV uid=501  
ENV gid=20    
  
### 2.3 rfriends3のイメージを作成し実行する。
  
```
docker compose up  
... 
rfriends3が使用できます。  
```
  
と表示されたら成功です。  
  
> [!TIP]
> "permission denied"のエラーが出る場合は以下を試してみてください。   
> sudo chmod 666 /var/run/docker.sock  
  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
  
ホスト(mac)のIPアドレスに従って、
```
http://IPアドレス:8000
```
と入力するとrfriends3が表示されます。
    
### 2.5 終了  
```
Terminalでctl-cを3回入力してコンテナを終了させてください。
```
  
終了すると、rfriends3の実行も終了するため、Webアクセスはできなくなります。  
    
以上  
  
  
  

  
  

