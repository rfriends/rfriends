## Linux/BSD版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux/BSD版です。(ubuntu/debian/chrome/android/stream/rocky/Alma/FreeBSD/Alpine/openSUSE/arch)  
インストールは全自動で行います。  
  
> [!NOTE]  
> Apache2版を追加しました。(2025/08/15)  
> lighttpdの代わりにApache2をインストールします。
> 現在は以下の2つに対応  
> install_debian_apache2.sh  
> install_ubunutu_apache2.sh
>   
> ほかのディストリビューションについては、掲示板、Xで要望がありましたらできるだけ対応します。
  
  
> [!CAUTION]
> インストールするシステムにすでにapache2がインストールされている場合は、  
> それを停止させるか、rfriendsよりapache2をインストールしないでください。  
> export optapache2="off"
>   
> インストールするシステムにすでにSAMBAサーバがインストールされている場合は、  
> それを停止させるか、rfriendsよりSambaをインストールしないでください。  
> export optsamba="off"  
     
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第27版　2025/08/15  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  
  
> [!NOTE]
> ここでは、systemd以外のものをすべてinitと記述しています。 (pgrep -o systemd)  
> 突っ込みどころ満載ですが、お許しください。  

### 1.1 Ubuntu系  (install_ubuntu.sh)
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/05/03|△| Ubuntu (D10)|18|/etc/apt/sources.list<br>を変更|  
|2025/04/27|△| Ubuntu (D10)|19|/etc/apt/sources.list<br>を変更|  
|2025/04/26|〇| Ubuntu (D11)|20||  
|2025/04/26|◎| Ubuntu (D12)|22||  
|2025/04/26|◎| Ubuntu (D13)|24||  
|2025/04/26|〇| Ubuntu (D13)|25||  
|2025/04/26|〇| ZORIN OS|17.3||  
  
### 1.2 Debian系  (install_debian.sh)
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/05/03|〇| Debian (Stretch)|9||  
|2025/04/27|〇| Debian (Buster)|10||  
|2025/04/26|◎| Debian (Bullseye)|11||  
|2025/04/26|◎| Debian (Bookworm)|12||  
|2025/08/14|〇| Debian (Trixie)|13|apache版使用|  
|2025/05/02|〇| Kali linux|-||  
  
> [!CAUTION]
> debian13の場合は、install_debian_apache2.sh 
  
 ・linux開発環境  
   
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/01/24|〇| Chromeos|134|Debian 12|   
|2025/04/25|〇| Chromeos flex|135|Debian 12|   
|2025/02/26|〇| Android(pixel)|15, 16|Debian 12|  
  
 ・init  
   
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/04/28|〇| Devuan (Daedalus)|5||  
|2025/04/28|〇| MX linux|21.3|Debian 11|  
|2025/04/30|〇| antiX linux|23.2|Debian 12|  
  
### 1.3 CentOS Stream系  (install_stream.sh)
  
|最終確認|判定|ディストロ|Ver.|備考|    
|---|:---:|---|---|---|  
|2025/05/03|△|CentOS|8.5|/etc/yum/repos.d<br>を変更|  
|2025/04/26|〇|CentOS stream|9||  
|2025/08/05|〇|CentOS stream|10||  
|2025/04/20|◎|Rocky linux|9.5||  
|2025/04/20|◎|Alma linux|9.5||  
|2025/04/20|〇|Oracle linux|9.5||   
|2025/04/20|〇|Miracle linux|9.4||  
|2025/04/25|〇|fedora linux|39||  
|2025/04/25|〇|fedora linux|42||  

### 1.4 BSD系  (install_freebsd.sh) init  

|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/04/27|〇|FreeBSD|13.5|samba419を選択|  
|2025/04/21|◎|FreeBSD|14.2|samba419を選択|  
  
### 1.5 その他  

|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/07/18|〇|Alpine|3.21|install_alpine.sh<br>init(OpenRC)|  
|2025/07/16|△|Arch linux|-|install_arch.sh|   
|2025/04/25|〇|openSUSE|15.6|install_suse.sh|  
  
・Arch linux ではlighttpdに不具合があり、DevelopmentServerを使用してください。  
  
## ２．インストール準備  
以下のことを確認してください。 
ほとんどのディストロでインストール時に2)は設定可能です。  
 
1) システムを最新にし、アプリを追加する。  
2) 実行するユーザを追加し、管理者権限を付加する。  
3) その他   
  
### 2.1 Ubuntu/ZORINの場合  
  
1) システムを最新にし、アプリを追加する。   
```  
# apt-get update  
# apt-get upgrade -y

# apt-get install sudo vim -y
# apt-get install git -y  
```
2) 実行するユーザを追加し、管理者権限を付加する。  
```
# useradd -m -G sudo ユーザ名
# passwd ユーザ名
# chsh -s /bin/bash ユーザ名  
```
### 2.2 Debian/Linux開発環境の場合  

1) システムを最新にし、アプリを追加する。   
```  
# apt-get update  
# apt-get upgrade -y

# apt-get install sudo vim -y
# apt-get install git -y
```
2) 実行するユーザを追加し、管理者権限を付加する。  
```
# useradd -m -G sudo ユーザ名
# passwd ユーザ名
# chsh -s /bin/bash ユーザ名  
```
> [!NOTE]
> すでにユーザ追加済で管理者権限を付加したい場合は、 rootでログインし  
> \# gpasswd -a ユーザ名 sudo  
> その後必ず再起動してください。
  
### 2.3 stream/rocky/alma/oracle/miracle/fedoraの場合  
1) システムを最新にし、アプリを追加する。    
```  
# dnf update
# dnf upgrade

# dnf install git
```
2) 実行するユーザを追加し、管理者権限を付加する。
```
# useradd -m -G wheel ユーザ名 
# passwd ユーザ名
```
### 2.4 FreeBSDの場合  
  
1) システムを最新にし、アプリを追加する。    
```  
# pkg update 
# pkg upgrade

# pkg install -y sudo 
# pkg install -y git   
```
2) 実行するユーザを追加し、管理者権限を付加する。  
```  
# adduser ユーザ名
# pw groupmod wheel -m ユーザ名 

%wheelのコメント(#)を外す
# visudo
%wheel ALL=(ALL:ALL) ALL
```
3) その他

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
### 2.5 alpineの場合  

```  
# apk update
# apk upgrade

# apk add sudo
# apk add git
# apk add tzdata

# adduser ユーザ名 
# addgroup ユーザ名 wheel

# visudo
%wheel ALL=(ALL:ALL) ALL

testingを追加(atomicparsleyのため)
# vi /etc/apk/repositories
https://dl-cdn.alpinelinux.org/alpine/edge/testing
```
### 2.6 openSUSEの場合  

```  
# zypper refresh
# zypper update

# zypper install vim
# zypper install git

# useradd -m -G wheel ユーザ名 
# passwd ユーザ名 

# visudo
%wheel ALL=(ALL:ALL) ALL
```

### 2.7 arch linuxの場合  

```  
# pacman -Syyu

# pacman -S vi
# pacman -S sudo
# pacman -S git

# useradd -m -G wheel ユーザ名 
# passwd ユーザ名 

# visudo
%wheel ALL=(ALL:ALL) ALL
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
詳細な使用方法は、  
https://rfriends.github.io/rfriends/manual/  
を参照してください。    
  
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
