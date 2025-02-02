## docker版rfriends3でラジオ録音  
   
　rfriendsがどんなものか試してみたい方のためにdocker環境用に作成しました。  
 コンテナを終了させても、録音データ、パラメータ設定は消えないようにしました。  
   
 Docker Engine, Docker Desktop for Windows, Docker Desktop for macOSに対応。  
  
![engine](https://github.com/user-attachments/assets/2d6ffc34-7771-438e-9057-0cf7ccb93a28)
  
## １．docker環境構築
  
dockerのインストールからrfriends3の実行までは環境別に記述しています。  
  
### 1.1 Docker Enginee, Composeのインストール  
  
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
  
### 1.2 Docker Desktop for macOSのインストール  
  
以下のサイトを参考にインストールしてください。  
公式のサイトからdmgファイルをダウンロードしてインストールするだけです。  
  
[Mac に Docker Desktop をインストール](https://docs.docker.jp/docker-for-mac/install.html)    
  
### 1.3 Docker Desktop for windowsのインストール  

・Docker Desktopをインストールしてください。  
  
[Docker Desktop for Windows](https://docs.docker.jp/docker-for-windows/install.html)  
  
・次に、Git Bashをインストールしてください。  
  
[Git Bash](https://gitforwindows.org/)  
  
Windows Terminalでgitが使用できるようにする。 
   
![1](https://github.com/user-attachments/assets/27e1b965-ccc8-4f60-957b-3c89b621a3cf)
  
ファイルを変更したときに改行コードを変更しない。  
  
![2](https://github.com/user-attachments/assets/570cc64c-a6e3-4e2f-88f5-8f194a7eefc0)  
   
## ２．実行  
  
　Dockerイメージの作成から実行まではTerminal上で以下の操作を行ってください。  
 
### 2.1 操作するユーザをdockerグループに追加する。  
  
```
sudo gpasswd -a $USER docker  
sudo systemctl restart docker  
exit  
```
  
再ログインしてください。  
sudoなしでdockerが操作できます。  
　
### 2.2 rfriends_docker.gitをクローンする。  
  
```
cd ~/
rm -rf rfriends_docker
git clone https://github.com/rfriends/rfriends_docker.git   
```
 
### 2.3 uid,gidの変更をおこなう。  
  
> [!CAUTION]  
> この修正をしなくても動作は可能ですが、shareディレクトリ内のファイルの修正ができない可能性があります。
>   
  
１）ホストでidを実行する。 
```
id  
```
uid=1000(user) gid=1000(user)  

> [!NOTE]  
> macの場合、uid=501(user) gid=20(staff)
>
  
２）Dockerファイルを修正する。  
  
```
cd rfriends_docker  
vi Dockerfile  
```
   
Dockerfileのuid,gidを設定してください。  
uuuu,ggggは１）で表示されたものを指定してください。  
  
ENV uid=uuuu  
ENV gid=gggg    
  
### 2.4 イメージの作成および実行を行う。  
  
```
cd  
cd rfriends_docker  
docker compose up  
...  
  
rfriendsが使用できます。  
```
  
と表示されたら成功です。  
  
> [!TIP]
> "permission denied"のエラーが出る場合は以下を試してみてください。   
> sudo chmod 666 /var/run/docker.sock  
  
### 2.5 rfriends3にアクセスする  
  
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
    
## ３．コンテナの操作  
  
Webでrfriends3の起動が確認出来たら、ctrl-cを3回でコンテナを停止させてください。  
次に、以下のコマンドを入力してください。  
  
$ docker ps -a  
  

|CONTAINER ID   |IMAGE       |NAMES|  
|---|---|---|  
|7d58171ef373   |rfriends3   |rfriends_docker-radio-1 | 
  
コンテナ名が、rfriends_docker-radio-1、となっているのがわかります。  
以下で再起動できます。  
  
$ docker start rfriends_docker-radio-1  
rfriends_docker-radio-1  
  
停止はctrl-cを3回ではなく、以下のコマンドになります。  
$ docker stop rfriends_docker-radio-1  
rfriends_docker-radio-1  

## ４．使用方法
  
１）システム構築後に、まずrfriends3を最新に更新してください。  
[ヘルプ]-[システム更新]で安定版1.1.3c以上にする。 
 
２）定期実行処理を登録する。  
**定期処理を行わない場合は、この処理は不要です。**  
  
[設定]-[定期実行]-[登録]でcrontab登録を実行する。  
crontab登録時に復元データを自動で作成します。  
  
３）使用法については、マニュアルおよびチュートリアルを参考にしてください。  
[マニュアル](https://github.com/rfriends/rfriends/blob/gh-pages/manual/index.md)  
  
## ５．データ保存・復元  
  
$HOME/share/smbdir/usr2  
$HOME/share/rfriends3/config  
  
コンテナを終了させても、ホストの上記の場所に録音データ、パラメータ設定が保存されています。 
  
ただし、予約データ・定期実行処理設定は消えるので、コンテナの再起動時に自動復元処理を行い、それらを（ほぼ）復元します。

> [!CAUTION]  
> ただし、復元するのはキーワード予約で、マニュアル予約は復元できません。  
  
## ６．スクリーンショット  

  Docker Engine  
  
![10](https://github.com/user-attachments/assets/2be51085-b960-41e5-89ea-c29cc58ed233)

  Docker Desktop for mac  
  
![20](https://github.com/user-attachments/assets/ac099242-4684-4ebf-9a41-da3cd68d3c88)

  Docker Desktop for windows  
  
![30](https://github.com/user-attachments/assets/d91db14c-eb5b-40aa-be50-3f91fc6c02e8)


以上  
  
  
  
