## rfriends3のインストール手順(LXD編）  
  
　LXDでrfriends3の環境を作ってみました。    
   
> [!CAUTION]
> ホスト側とコンテナ側を混同しやすいので注意が必要です。  
  
## １．ホスト側の設定  
    
　ホストはUbuntu 24.04.1 LTSで行いました。  
  
１）LXDインストールと初期化  
    
lxd導入済みの場合は飛ばしてください。  
  
初期化(init)に関しては、基本的に省略時設定で進めます。  
すべてリターンでOK.  
```
ホスト：  
$ sudo snap install lxd  
$ sudo lxd init   
```  
２）コンテナ作成  
    
rfriends3というubuntu 24.04のコンテナを作成します。  
```  
ホスト：  
$ sudo lxc launch ubuntu:24.04 rfriends3  
Creating rfriends3
Starting rfriends3
```  
## ２．タイムゾーンの設定とユーザの作成  
    
以下のコマンドを実行し、コンテナにrootでログインします。  
```  
ホスト：  
$ sudo lxc exec rfriends3 -- /bin/bash  
```  
  
以下のコマンドを実行し、タイムゾーンを設定します。    
```
コンテナ：    
# ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime  
``` 
  
以下のコマンドを実行し、ユーザを作成します。  
ユーザはradio、パスワードはpassと仮定します。    
```
コンテナ：    
# adduser radio  
# passwd radio  
# gpasswd -a radio sudo  
# exit  
```  
ユーザの作成が完了したら、exitでコンテナからホストに戻ってください。  
  
## ３．rfriendsのインストール  
    
以下のコマンドを実行し、ユーザradioでログインします。  
```  
ホスト：  
$ sudo lxc exec rfriends3 -- su radio  
```  
  
以下のコマンドを実行し、rfriends3をインストールします。  
```  
コンテナ：
  
cd ~/  
sudo apt-get install git -y  
rm -rf rfriends3_core  
git clone https://github.com/rfriends/rfriends3_core.git  
cd rfriends3_core  
sh install_ubuntu.sh  
  
finished  
  
$ hostname -I  
IPアドレスが表示されます。  
  
$ exit  
```  
exitしてもコンテナは動作したままです。
    
## ４．rfriends3の起動
  
ホストのWEBブラウザから  
  
IPアドレス:8000  
  
でrfriends3が使えるようになります。  
使用法については  
[チュートリアル](https://github.com/rfriends/rfriends3/wiki/%EF%BC%90%EF%BC%90%EF%BC%8E%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)   
を参照してください。
  
なお、コンテナを停止する場合は、  
```
ホスト：
$ sudo lxc stop rfriends3
```
です。  
  
以上  
  


以下のサイトが非常に参考になります。  
[Dockerに疲れた人のためのLXDではじめるシステムコンテナ入門](https://speakerdeck.com/devops_vtj/dockernipi-retaren-notamenolxddehazimerusisutemukontenaru-men)
