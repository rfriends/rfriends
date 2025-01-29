## rfriends3のインストール手順(LXD編）  
[ホーム](https://rfriends.github.io/rfriends/)  
  
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
  
## ５．その他  

LXDに関しては、以下のサイトが非常に参考になります。  
  
[Dockerに疲れた人のためのLXDではじめるシステムコンテナ入門]
<https://speakerdeck.com/devops_vtj/dockernipi-retaren-notamenolxddehazimerusisutemukontenaru-men>
  
以上  
  
