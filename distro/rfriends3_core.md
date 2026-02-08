## Linux版rfriends3でラジオ録音（Ubuntu/Debian）    
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux版です。  
インストールは全自動で行います。  
  
Linux/BSD版は、ディストリビューションにより以下の3つに分かれています。  
  
・（１）[Linux版(Ubuntu/Debian)](rfriends3_core.md) (ubuntu/debian/chrome/android)  
・（２）[Linux版(CentOS Stream)](rfriends3_core2.md) (stream/rocky/Alma)  
・（３）[Linux版(その他)](rfriends3_core3.md) (Alpine/openSUSE/arch/ios)  
・（４）[BSD版](rfriends3_core_bsd.md)  
  
> [!NOTE]  
> Apache2版を追加しました。(2025/08/15)  
> lighttpdの代わりにApache2をインストールします。  
> 現在は以下の2つに対応  
> install_debian_apache2.sh  
> install_ubuntu_apache2.sh
>     
> インストールするシステムにすでにapache2がインストールされている場合は、  
> それを停止させるか、Apache2版をインストールしないでください。  
>     
> ほかのディストリビューションについては、掲示板、Xで要望がありましたらできるだけ対応します。
  
 
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第31版　2026/02/09 
  
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
|2025/12/11|〇| ZORIN OS|18||  
  
### 1.2 Debian系  (install_debian.sh)
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/05/03|〇| Debian (Stretch)|9||  
|2025/04/27|〇| Debian (Buster)|10||  
|2025/04/26|◎| Debian (Bullseye)|11||  
|2025/04/26|◎| Debian (Bookworm)|12||  
|2025/08/14|〇| Debian (Trixie)|13|~~apache版使用~~|  
|2025/05/02|〇| Kali linux|-||  
|2026/02/09|✕| eLxr linux|12.0.0|atコマンドなし|  
  
> [!CAUTION]
> ~~debian13の場合は、install_debian_apache2.sh~~ 
  
 ・linux開発環境  
   
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/01/24|〇| Chromeos|134|Debian 12|   
|2025/04/25|〇| Chromeos flex|135|Debian 12|   
|2025/02/26|〇| Android(pixel)|15, 16|Debian 12|  
  
 ・init  
   
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/04/28|〇| Devuan (Daedalus)|5|Debian 12|  
|2026/02/06|〇| Devuan (excalibur)|6.1|Debian 13|  
|2025/04/28|〇| MX linux|21.3|Debian 11|  
|2026/02/06|〇| MX linux|25|Debian 13　lighttpd版使用|  
|2025/04/30|〇| antiX linux|23.2|Debian 12|  
    
  
  
## ２．インストール準備  
  
以下のことを確認してください。 
  
1) システムを最新にし、アプリを追加する。  
2) 実行するユーザを追加し、管理者権限を付加する。  
3) その他   
  
> [!NOTE]
> ほとんどのディストロでインストール時に2)は設定可能です。  
> すでにユーザ追加済で管理者権限を付加したい場合は、 rootでログインし  
> \# gpasswd -a ユーザ名 sudo  
> その後必ず再起動してください。
  
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
3) ログアウトする。
```
# exit
``` 
  
実行shは、install_ubuntu.sh または、install_ubuntu_apache2.sh です。  
  

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
3) もし、インストール時にユーザが追加済で、管理者権限がない場合。  
```
# groups ユーザ名
sudoがない場合  
# gpasswd -a ユーザ名 sudo 
```
    
実行shは、install_debian.sh または、install_debian_apache2.sh です。  
ただしdebian13は、install_debian_apache2.sh です。
  
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
