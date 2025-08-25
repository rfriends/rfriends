## （２）Linux版rfriends3でラジオ録音（その他）  
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux版です。  
インストールは全自動で行います。  
  
Linux/BSD版は、ディストリビューションにより以下の４つに分かれています。   
  
・（１）[Linux版(Ubuntu/Debian)](rfriends3_core.md) (ubuntu/debian/chrome/android)  
・（２）[Linux版(CentOS Stream)](rfriends3_core2.md) (stream/rocky/Alma)  
・（３）[Linux版(その他)](rfriends3_core3.md) (Alpine/openSUSE/arch/ios)  
・（４）[BSD版](rfriends3_core_bsd.md)  
  
> [!NOTE]  
> Apache2版については、現在debian/ubuntu版のみですが、  
> 掲示板、Xで要望がありましたらできるだけ対応します。

![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第28版　2025/08/16  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  
  
> [!NOTE]
> ここでは、systemd以外のものをすべてinitと記述しています。 (pgrep -o systemd)  
> 突っ込みどころ満載ですが、お許しください。  
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/07/18|〇|Alpine|3.21|install_alpine.sh<br>init(OpenRC)|  
|2025/08/16|〇|Alpine|3.22|install_alpine.sh<br>init(OpenRC)|  
|2025/07/16|△|Arch linux|-|install_arch_apache2.sh|   
|2025/04/25|〇|openSUSE|15.6|install_suse.sh|  

  
## ２．インストール準備  
以下のことを確認してください。 
ほとんどのディストロでインストール時に2)は設定可能です。  
 
1) システムを最新にし、アプリを追加する。  
2) 実行するユーザを追加し、管理者権限を付加する。  
3) その他   
  
  
### 2.1 alpineの場合  

1) 初期設定を行う。   
  
```  
# setup-alpine  
```  
  
2) リポジトリ設定  
  
v3.22はバージョンにより異なる。  
communityリポジトリを有効にする。(#を削除)  
testingを追加する。(atomicparsleyのため)  
  
```  
# vi /etc/apk/repositories
https://dl-cdn.alpinelinux.org/alpine/v3.22/main
https://dl-cdn.alpinelinux.org/alpine/v3.22/community
https://dl-cdn.alpinelinux.org/alpine/edge/testing
```  
    
3) ユーザ追加  
  
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
```  
  
> [!NOTE]  
> shutdownはpoweroff    
    
実行shは、install_alpine.sh です。  
  
### 2.2 openSUSEの場合  

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
  
実行shは、install_suse.sh です。  
  
### 2.3 arch linuxの場合  

```  
# pacman -Syu

# pacman -S vi
# pacman -S sudo
# pacman -S git

# useradd -m -G wheel ユーザ名 
# passwd ユーザ名 

# visudo
%wheel ALL=(ALL:ALL) ALL
```
  
実行shは、install_arch_apache2.sh です。  
    
・Arch linux ではlighttpdに不具合があり、Apache2を標準としました。  
　現在、webdavは使用できません。  
  
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能なユーザでログインします。  
 
> [!CAUTION]
> 必ず２で確認したユーザでログインしてください。    
  
　ディストリビューション別のrfriends3インストールスクリプト（install_XXXXX.sh）を実行します。  
「１．ディストリビューション」で実行シェルを確認してください。  
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
> [!CAUTION]
> インストールするシステムにすでにSAMBAサーバがインストールされている場合は、  
> それを停止させるか、rfriendsよりSambaをインストールしないでください。  
> export optsamba="off"  
     
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
  
・デイリー処理のために「設定」->「定期実行」->「登録」をしている場合は、必ず、「設定」->「定期実行」->「取消」をしてください。  
・次にrfriends3フォルダを削除してください。  
・これでアンインストールは終了です。  
  
  

以上  
