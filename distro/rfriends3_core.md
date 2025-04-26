## Linux/BSD版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux/BSD版です。(ubuntu/debian/chrome/android/stream/rocky/Alma/FreeBSD/Alpine/openSUSE/arch)  
インストールは全自動で行います。  

> [!CAUTION]
> インストールするシステムにすでにSAMBAサーバがインストールされている場合は、  
> それを停止させるか、rfriendsよりSambaをインストールしないでください。  
> export optsamba="off"  
     
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第19版　2025/04/27  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  

### 1.1 Ubuntu系  (install_ubuntu.sh)
  
|最終確認|ディストロ|Ver.|ステータス|   
|---|---|---|---|  
|2025/04/26|Ubuntu (D11)|20|〇|  
|2025/04/26|Ubuntu (D12)|22|〇|  
|2025/04/26|Ubuntu (D13)|24|〇|  
|2025/04/26|Ubuntu (D13)|25|〇|  
|2025/04/26|Debian|11|〇|  
|2025/04/26|Debian|12|〇|  
|2025/04/26|ZORIN OS|17.3|〇|  
|2025/01/24|Chromeos linux開発|134|〇|   
|2025/04/25|Chromeos flex linux開発|135|〇|   
|2025/02/26|Android(pixel) linux開発|15, 16|〇|  
  
### 1.2 CentOS Stream系  (install_stream.sh)
  
|最終確認|ディストロ|Ver.|ステータス|    
|---|---|---|---|  
|2025/04/27|CentOS|8.5|atomicparsleyなし(△)|  
|2025/04/26|CentOS stream|9|〇|  
|2025/04/20|Rocky linux|9.5|〇|  
|2025/04/20|Alma linux|9.5|〇|  
|2025/04/20|Oracle linux|9.5|〇|   
|2025/04/20|Miracle linux|9.4|〇|  
|2025/04/25|fedora linux|39|〇|  
|2025/04/25|fedora linux|42|〇|  

### 1.3 BSD系  (install_freebsd.sh)

|最終確認|ディストロ|Ver.|ステータス|   
|---|---|---|---|  
|2025/04/27|FreeBSD|13.5|samba419を選択(〇)|  
|2025/04/21|FreeBSD|14.2|samba419を選択(〇)|  
  
### 1.4 その他  

|最終確認|ディストロ|Ver.|ステータス|   
|---|---|---|---|  
|2025/04/20|Alpine|3.21|install_alpine.sh(〇)|  
|2025/04/25|Arch linux|-|install_arch.sh (〇)|   
|2025/04/25|openSUSE|15.6|install_suse.sh (〇)|  

## ２．インストール準備  
以下のことを確認してください。 
 
1) システムを最新にする。  
2) タイムゾーンを日本にする。  
3) 実行するユーザを追加し、管理者権限を付加する。  
4) gitをインストールする。  
5) その他   
  
### 2.1 Ubuntu/debian/ZORINの場合  
  
1) システムを最新にする。  
```  
# apt-get update  
# apt-get upgrade -y
```
2) タイムゾーンを日本にする。  
```
# timedatectl set-timezone Asia/Tokyo
```
3) 実行するユーザを追加し、管理者権限を付加する。  
```
もしインストールされていないなら
# apt-get install sudo vim -y

# useradd -m -G sudo ユーザ名
# passwd ユーザ名
# chsh -s /bin/bash ユーザ名  
```
4) gitをインストールする。  
```  
# apt-get install git -y  
```
### 2.2 stream/rocky/alma/oracle/miracle/fedoraの場合  
1) システムを最新にする。  
```  
# dnf update
# dnf upgrade
```
2) タイムゾーンを日本にする。
```
# timedatectl set-timezone Asia/Tokyo 
```
3) 実行するユーザを追加し、管理者権限を付加する。
```
# useradd -m -G wheel ユーザ名 
# passwd ユーザ名
```
4) gitをインストールする。
```
# dnf install git
```
5) その他

まず、以下の設定（セキュリティOFF）で実行し、うまくいったらセキュリティ設定を行ってください。  
  

SELINUX をdisableにする
```
# vi /etc/selinux/config
SELINUX=disabled
```
firewalldをdisableにする
```
# systemctl stop firewalld
# systemctl disable firewalld
```
### 2.3 FreeBSDの場合  
  
1) システムを最新にする。  
```  
# pkg update 
# pkg upgrade
```
2) タイムゾーンを日本にする。  
```
# tzsetup Asia/Tokyo   
```
3) 実行するユーザを追加し、管理者権限を付加する。  
```  
# adduser ユーザ名
# pkg install -y sudo 
%wheelのコメント(#)を外す
# visudo
%wheel ALL=(ALL:ALL) ALL
# pw groupmod wheel -m ユーザ名 
```
4) gitをインストールする。  
```  
# pkg install -y git   
```  
5) その他

・rc.conf設定  
```
$ sudo vi /etc/rc.conf
cron_enable="YES"
samba_server_enable="YES"
lighttpd_enable="YES"
```  
・php,sambaのversion確認
```
$ pkg search PHP | grep Scripting
php84-8.4.5_1                  PHP Scripting Language (8.4.X branch)
$ pkg search samba
samba416-4.16.11_6  
samba419-4.19.9_8  
samba420-4.20.7_4   
```
・git clone 後、インストール実行前にinstall_freebsd.shの該当箇所を変更してください。  
> [!CAUTION]
> 2025/04/19現在、samba420は書き込みエラーが出ます。
> samba419 を選択してください。  

```
export php="php84"
export samba="samba419"
```
### 2.4 alpineの場合  

```  
# apk update
# apk upgrade

# apk add tzdata
# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# apk add sudo

# visudo
%wheel ALL=(ALL:ALL) ALL

# adduser ユーザ名 
# addgroup ユーザ名 wheel

# apk add git

testingを追加(atomicparsleyのため)
# vi /etc/apk/repositories
https://dl-cdn.alpinelinux.org/alpine/edge/testing
```
### 2.5 openSUSEの場合  

```  
# zypper refresh
# zypper update

# timedatectl set-timezone Asia/Tokyo  

# useradd -m ユーザ名 
# passwd ユーザ名 

# groupadd wheel
# usermod -G wheel root
# usermod -G wheel ユーザ名 

# zypper install vim

# visudo
%wheel ALL=(ALL:ALL) ALL

# zypper install git
```

### 2.6 arch linuxの場合  

```  
# pacman -Syyu

# timedatectl set-timezone Asia/Tokyo

# pacman -S vi
# pacman -S sudo

# visudo
%wheel ALL=(ALL:ALL) ALL

# useradd -m ユーザ名 
# passwd ユーザ名 

# usermod -G wheel root
# usermod -G wheel ユーザ名 

# pacman -S git
```  
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能なユーザでログインします。  
 
> [!CAUTION]
> 必ず２で確認したユーザでログインしてください。    
  
　ディストリビューション別のrfriends3インストールスクリプト（install_XXXXX.sh）を実行します。  
「１．ディストリビューション」で実行シェルを確認してください。  
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
$ cd ~/
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh install_XXXXX.sh
```  
  
これでインストールは完了です。  
再起動してください。  
```
$ sudo reboot
```  
  
## ４．rfriends3の実行  
  
以下を入力します。ipコマンドがない場合は、ifconfigを使用してください。  
```  
$ ip -4 -br a | grep -v "127.0.0.1"  
　eth0 UNKNOWN XXX.XXX.XXX.XXX/24  
```  
または  
```  
$ hostname -I  
```  
このIPアドレス（XXX.XXX.XXX.XXX）がwebサーバアドレスです。  
  
ウェブブラウザ（edge,chrome,firefox,...）を起動し、上記で表示されたアドレスにアクセスする。  
  
http://XXX.XXX.XXX.XXX:8000  
  
以下のような画面が出たら成功です。ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
![2](https://github.com/user-attachments/assets/c4cc72cc-659c-4c29-bbfe-3f4951b9556c)
  
「ヘルプ」「システム更新」でシステムを最新にしてください。 
  
## ５．samba  
  
　windowsの場合、エクスプローラに先ほどのIPアドレス(xxx.xxx.xxx.xxx)を入力すれば、録音ディレクトリにアクセスできます。smbdirというディレクトリが見えると思います。  
  
\\XXX.XXX.XXX.XXX  
  
\\は￥￥です。  
  
スマホからでもファイルマネージャでアクセスできます。  
  
iPhoneの場合、ファイル - 3点リーダー - サーバー接続smb://xxx.xxx.xxx.xxx、ゲストで接続できます。  
  
androidの場合も各種ファイルマネージャで可能です。（ファイルマネージャ＋推奨）  
  
![3](https://github.com/user-attachments/assets/d504cf68-0a3a-4701-92e5-199300647398)  
  
## ６．rfriends3のアンインストール  
  
デイリー処理設定をしている場合は、必ず、「設定」->「デイリー処理」->「取消」をしてください。または、crontab -e です。  
rfriends3フォルダを削除してください。  
アンインストールは終了です。  
  
  

以上  
