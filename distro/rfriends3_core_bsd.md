## BSD版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したBSD版です。  
インストールは全自動で行います。  
  
Linux/BSD版は、ディストリビューションにより以下の5つに分かれています。  
  
・（１）[Linux版(Ubuntu/Debian)](rfriends3_core.md) (ubuntu/debian/chrome/android)  
・（２）[Linux版(CentOS Stream)](rfriends3_core2.md) (stream/rocky/Alma)  
・（３）[Linux版(Arch)](rfriends3_core3.md) (arch/Manjaro/Cachy/EndeavourOS)  
・（４）[Linux版(その他)](rfriends3_core4.md) (Alpine/openSUSE/ios)  
・（５）[BSD版](rfriends3_core_bsd.md)  
> [!NOTE]  
> Apache2版については、現在debian/ubuntu対応ですが、  
> 掲示板、Xで要望がありましたらできるだけ対応します。
  

![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第32版　2026/06/06  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  
  
> [!NOTE]
> ここでは、systemd以外のものをすべてinitと記述しています。 (pgrep -o systemd)  
> 突っ込みどころ満載ですが、お許しください。  

### 1.1 BSD系  (install_freebsd.sh) init  

|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2025/04/27|〇|FreeBSD|13.5|samba419を選択|  
|2025/04/21|〇|FreeBSD|14.2|samba419を選択|  
|2025/08/16|〇|FreeBSD|14.3|samba419を選択|  
|2026/06/06|◎|FreeBSD|15.0|samba422を選択|  
|2026/05/30|〇|GhostBSD|26.1(15)|samba419を選択|  

2026/06/06 samba422でfreeBSD をインストールしましたが問題なく動作しています。  
他もsamba422で問題ないと思います。  
  
  
## ２．インストール準備  
以下のことを確認してください。 
ほとんどのディストロでインストール時に2)は設定可能です。  
 
1) システムを最新にし、アプリを追加する。  
2) 実行するユーザを追加し、管理者権限を付加する。  
3) その他   
  
  
### 2.1 FreeBSDの場合  
  
1) システムを最新にし、アプリを追加する。    
```  
# pkg update 
# pkg upgrade

# pkg install -y sudo 
# pkg install -y git   
```
2) 実行するユーザを追加し、管理者権限を付加する。  
```  
# pw useradd ユーザ名 -m
# passwd ユーザ名 
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
$ pkg search php | grep Scripting  
php82-8.2.30                   PHP Scripting Language (8.2.X branch)  
php83-8.3.30                   PHP Scripting Language (8.3.X branch)  
php84-8.4.19                   PHP Scripting Language (8.4.X branch)  
php85-8.5.4                    PHP Scripting Language (8.5.X branch)  
  
$ pkg search samba  
samba416-4.16.11_10            Free SMB/CIFS and AD/DC server and client for Unix  
samba419-4.19.9_12             Free SMB/CIFS and AD/DC server and client for Unix  
samba420-4.20.8_1              Free SMB/CIFS and AD/DC server and client for Unix  
samba422-4.22.7_1              Free SMB/CIFS and AD/DC server and client for Unix  
samba423-4.23.6_1              Free SMB/CIFS and AD/DC server and client for Unix  
```
・git clone 後、インストール実行前にinstall_freebsd.shの該当箇所を変更してください。  
> [!CAUTION]  
> 2025/04/19現在、samba420は書き込みエラーが出ます。  
> samba420 以外を選択してください。  
> 2026/06/06現在、samba422 がお勧め。  

```
export php="php84"
export samba="samba422"
```  
  
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能なユーザでログインします。  
 
> [!CAUTION]
> 必ず２で確認したユーザでログインしてください。    
  
 rfriends3インストールスクリプト（install_freebsd.sh）を実行します。  
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
$ sh install_freebsd.sh
```  
  
これでインストールは完了です。  
再起動してください。  
```
$ sudo reboot
```  
  
## ４．rfriends3の実行  
  
以下を入力します。ipコマンドがない場合は、ifconfigを使用してください。  
```  
$ ifconfig
　inet XXX.XXX.XXX.XXX  
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
