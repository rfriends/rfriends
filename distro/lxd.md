## LXD版rfriends3でラジオ録音  
  
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
root@rfriends3:~# timedatectl set-timezone Asia/Tokyo
root@rfriends3:~# timedatectl  
               Local time: Thu 2025-01-30 06:36:18 JST  
           Universal time: Wed 2025-01-29 21:36:18 UTC  
                 RTC time: n/a  
                Time zone: Asia/Tokyo (JST, +0900)  
System clock synchronized: yes  
              NTP service: inactive  
          RTC in local TZ: no  
``` 
  
以下のコマンドを実行し、ユーザを作成します。  
ユーザはradio、パスワードはpassと仮定します。    
```
コンテナ：
root@rfriends3:~# adduser radio
info: Adding user `radio' ...
...  
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for radio
Enter the new value, or press ENTER for the default
...  
Is the information correct? [Y/n] 
info: Adding new user `radio' to supplemental / extra groups `users' ...
info: Adding user `radio' to group `users' ...
```
radioユーザをsudoユーザに追加します。
```
コンテナ：
root@rfriends3:~# gpasswd -a radio sudo
Adding user radio to group sudo
```
ユーザの作成が完了したら、exitでコンテナからホストに戻ってください。  
```
コンテナ：
root@rfriends3:~# exit  
```  
  
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

インストールには時間がかかるので気長にお待ちください。  
...  
IP address : 10.117.74.193/24
Thu Jan 30 06:44:39 JST 2025
end install common
finished  
```
  
このIP addressをメモしてください。  
exitでコンテナからホストに戻ってください。  
```
コンテナ：
radio@rfriends3:~$ exit  
```  
exitしてもコンテナは動作したままです。
    
## ４．rfriends3の起動
  
ホストのWEBブラウザから上記で表示されたIPアドレスを入力します。   
  
```
10.117.74.193:8000  
```
  
でrfriends3が使えるようになります。  
  
使用法についてはマニュアルを参照してください。  
<https://rfriends.github.io/rfriends/manual/index.html>  
  
なお、コンテナを停止する場合は、  
```
ホスト：
$ sudo lxc stop rfriends3
```
です。  

> [!NOTE]
> 以下は必要に応じて実行してください。  
  
## ５．外部PCからアクセス  
  
作成したコンテナに外部(home)からsshでアクセスできるようにします。  
  
[home] ----- (internet) ----- [ホスト：50022] - [コンテナ1：22]  
  
[home] ----- (internet) ----- [ホスト：50122] - [コンテナ2：22]  
  
### 5.1 コンテナにssh serverのインストール  
  
コンテナ側で以下のコマンドを実行  
  
```  
$ sudo apt install openssh-sever  
$ exit  
```  
  
ホスト側で以下のコマンドを実行  
  
```  
$ sudo lxc list  
```  
  
rfriendsコンテナのIPV4アドレスが表示される。 xxx.xxx.xxx.xxx.xxxはrfriendsコンテナのIPアドレスとする。  
  
```  
ssh radio@xxx.xxx.xxx.xxx  
```  
  
でrfriendsコンテナにユーザradioでログインできるのを確認。  
  
```  
$ exit  
```  
  
### 5.2 コンテナにproxyデバイスを追加  
  
外部からrfriendsコンテナにSSHできるようにする。  
  
ホストのport:50022 -> rfriendsコンテナのport:22  
  
xxx.xxx.xxx.xxx.xxxはrfriendsコンテナのIPアドレス  
  
p50022の名前は任意。  
  
ポートが使われていないか調べる。使われていない場合、表示なし。  
  
```  
$ lsof -i:50022  
```  
  
proxyデバイスを追加  
  
```  
$ sudo lxc config device add rfriends p50022 \  
  proxy listen=tcp:0.0.0.0:50022 connect=tcp:xxx.xxx.xxx.xxx.xxx:22  
```  
  
設定を削除したいときは  
  
```  
$ sudo lxc config device remove rfriends p50022  
```  
  
### 5.3 外部からrfriendsコンテナにssh  
  
```  
ssh radio@yyy.yyy.yyy.yyy:50022  
```  
  
yyy.yyy.yyy.yyyはホストのIPアドレス  
  
アクセスできない場合、firewall等でポートが閉じられていないか調べる。  
  
## ６．LXDで作成したコンテナを複製する方法  
  
### 6.1 現状確認  
  
以下はrootで操作しています。  
  
```  
# lxc list  
rfriends | RUNNING | XXX.XXX.XXX.XXX (eth0) | 省略 (eth0) | CONTAINER | 0    
# lxc config device show rfriends  
p50022:  
 connect: tcp:XXX.XXX.XXX.XXX:22  
 listen: tcp:0.0.0.0:50022  
 type: proxy  
```  
  
### 6.2 rfriendsコンテナを複製  
  
```  
# lxc copy rfriends rfriends_copy  
# lxc list  
```  
  
| NAME         | STATE   | IPV4                   |  
|--------------|---------|------------------------|  
|rfriends      | RUNNING | XXX.XXX.XXX.XXX (eth0) |  
|rfriends_copy | STOPPED |                        |  
  
### 6.3 proxyデバイスの設定  
  
１）rfriendsのproxy設定もcopyされているのを確認  
  
```  
# lxc config device show rfriends_copy  
p50022:  
 connect: tcp:XXX.XXX.XXX.XXX:22  
 listen: tcp:0.0.0.0:50022  
 type: proxy  
```  
  
２）rfriends_copyのproxy設定を削除  
  
ポート番号が重複することになるので削除  
  
```  
# lxc config device remove rfriends_copy p50022  
Device p50022 removed from rfriends_copy  
```  
  
３）rfriends_copyコンテナをスタートさせる  
  
```  
# lxc start rfriends_copy  
```  
  
IPアドレスが振られているのを確認。  
  
```  
# lxc list  
```  
  
| NAME         | STATE   | IPV4                   |  
|--------------|---------|------------------------|  
|rfriends      | RUNNING | XXX.XXX.XXX.XXX (eth0) |  
|rfriends_copy | RUNNING |                        |  
  
４）proxyデバイスを追加  
  
ポートが使われていないか調べる。使われていない場合、表示なし。  
  
```  
$ lsof -i:50122  
```  
  
proxyデバイスを追加  
  
```  
$ sudo lxc config device add rfriends_copy p500122 \  
  proxy listen=tcp:0.0.0.0:50122 connect=tcp:zzz.zzz.zzz.zzz:22  
  
Device p500122 added to rfriends_copy  
```  
  
### 6.4 外部からrfriends_copyコンテナにssh  
  
```  
ssh radio@yyy.yyy.yyy.yyy:50122  
```  
  
yyy.yyy.yyy.yyyはホストのIPアドレス アクセスできない場合、firewall等でポートが閉じられていないか調べる。 データの転送は、teraterm(scp),Rlogin(sftp)が便利。  
  
### 6.5 その他  
  
以上でrfriendsコンテナと同じ環境のrfriends_copyコンテナが作成できました。 　同様の操作で、PCの能力が許す限りいくらでも複製できます。 rfriendsコンテナとrfriends_copyコンテナはポート番号の違いでアクセスできます。  
  
ssh radio@yyy.yyy.yyy.yyy:50022 (rfriends)  
ssh radio@yyy.yyy.yyy.yyy:50122 (rfriends_copy)  
  
## ７．補足  

LXDに関しては、以下のサイトが非常に参考になります。  
  
[Dockerに疲れた人のためのLXDではじめるシステムコンテナ入門]
<https://speakerdeck.com/devops_vtj/dockernipi-retaren-notamenolxddehazimerusisutemukontenaru-men>
  
以上  
  
