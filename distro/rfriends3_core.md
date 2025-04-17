## Linux/BSD版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux/BSD版です。(ubuntu/debian/chrome/android/stream/rocky/Alma/FreeBSD/Alpine/openSUSE/arch)  
インストールは全自動で行います。  

> [!CAUTION]
> arch,opensuse版は現在テスト中ですが、  
> どなたか、テストしていただけませんか？  
     
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第15版　2025/04/17  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
  
|確認日付|ディストロ|実行シェル|    
|---|---|---|  
|2025/01/24|ubuntu|install_ubuntu.sh|  
|2025/01/24|debian|install_ubuntu.sh|  
|2025/01/24|chromeos linux環境|install_ubuntu.sh|   
|2025/02/26|android linuxターミナル|install_ubuntu.sh| 
|2025/01/24|stream|install_stream.sh|  
|2025/01/24|rocky linux|install_stream.sh|  
|2025/04/17|alma linux|install_stream.sh|   
|2025/03/06|FreeBSD|install_freebsd.sh|  
|2025/04/15|alpine|install_alpine.sh|  

  
  
    
以下は、現在検証中のため正常動作しません。  
|確認日付|ディストロ|実行シェル|     
|---|---|---|   
|2025/04/15|arch linux|install_arch.sh|   
|2025/04/15|openSUSE|install_suse.sh|  

ダウロードサイトはこちら  
  
## ２．インストール準備  
以下のことを確認してください。 
 
1) システムを最新にする。  
2) 日付を日本にする。  
3) 実行するユーザを追加し、管理者権限を付加する。  
4) gitをインストールする。
5) その他 
  
### 2.1 Ubuntu/debianの場合  
  
1) システムを最新にする。  
```  
# apt-get update  
# apt-get upgrade -y
```
2) 日付を日本にする。  
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
### 2.2 FreeBSDの場合  
  
1) システムを最新にする。  
```  
# pkg update 
# pkg upgrade
# reboot
```
2) 日付を日本にする。  
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
samba420-4.20.7_4 
```
・git clone 後、インストール実行前にinstall_freebsdの該当箇所を変更してください。
```
export php="php84"
export samba="samba420"
```
### 2.3 stream/rocky/almaの場合  
```  
# dnf update
# dnf upgrade

# timedatectl set-timezone Asia/Tokyo 

# useradd -m -G wheel ユーザ名 
# passwd ユーザ名 

# dnf install git
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

# cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

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
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
$ cd ~/
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh install_XXXXX.sh  
```  
  
これでインストールは完了です。  
念のため、再起動してください。
  
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
  
> [!CAUTION]
> 現在、openSUSE,archlinuxではlighttpdは動作しません。
> ビルトインサーバをご利用ください。
> sh rf3server.sh
  
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
