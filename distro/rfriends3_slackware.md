## slackware版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はCLIに加えてWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux版です。  
インストールは全自動で行います。  
  
Linux/BSD版は、ディストリビューションにより以下の5つに分かれています。  
  
・（１）[Linux版(Ubuntu/Debian)](rfriends3_core.md) (ubuntu/debian/chrome/android)  
・（２）[Linux版(CentOS Stream)](rfriends3_core2.md) (stream/rocky/Alma)  
・（３）[Linux版(Arch)](rfriends3_core3.md) (arch/Manjaro/Cachy/EndeavourOS)  
・（４）[Linux版(その他)](rfriends3_core4.md) (Alpine/openSUSE/ios)  
・（５）[BSD版](rfriends3_core_bsd.md)  
  
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2026/06/13  
第版　2026/06/13
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  
  
> [!CAUTION]  
> 現在開発中につき、動作不良あり。    
> 不具合等あれば、掲示板のほうにお願いします。  
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2026/06/13|-|slackware|15.0|開発中|   
  
## ２．rfriends3のインストール準備    
  
以降の説明では、ユーザ名を仮に、swuserとします。  
  
### 2.1 ＯＳのインストール　  
   
slackwareのインストールについては、情報が大変少ないので、Google AIに質問するのが一番です。    
　
1) SELECT fullでインストールする。　
2) ユーザのグループをwheel audio video cdrom plugdev powerとする。　
　
### 2.2 初期設定  
  
 1）rootでログインし、ユーザ(swuser)をsudoユーザにする。  
  
```  
# visudo  
"%wheel ALL=(ALL) SETENV: ALL  
のコメント(#)をはずす。  
```  
  
2) ミラーサイトを追加する。  
  
```  
# vim /etc/slackpkg/mirrors  
最終行に以下を追加。  
https://ftp.osuosl.org/pub/slackware/slackware64-15.0/  
```  
  
3) 各種アップデートを行う。  
  
```  
# sbopkg -r    
# slackpkg update    
# slackpkg install-new    
# slackpkg upgrade-all  
```  
  
### 2.3 確認  
  
以下のことを確認してください。 
 
1) SELECT fullでインストールしていること。
2) 動作確認中はfirewall(iptables)をstopしてください。
3) sudo ユーザが存在。
4) slackpkg,sbopkgが導入済。  
5) 基本的な動作は確認済であること。   
  
```  
$ sudo sbopkg -r  
$ sudo slackpkg update  
$ sudo slackpkg update gpg  
$ sudo slackpkg upgrade-all
sudo PAGER=cat sbopkg -r
echo " 'q' リターンキーを押してください。"

OUTPUT=$(sudo slackpkg update 2>&1)
if echo "$OUTPUT" | grep -iq "GPG signature.*failed"; then
    echo " GPGエラーを検出しました。鍵の更新が必要です。"
    echo " sudo slackpkg update gpg を実行してください。"
    exit 1
fi
sudo slackpkg install-new
sudo slackpkg upgrade-all
```
  
  
### 2.4 実行shは、install_slackware.sh です。  

      
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能なユーザでログインします。  
 
> [!CAUTION]
> 必ず２で確認したユーザでログインしてください。    
  
　rfriends3インストールスクリプト（install_slackware.sh）を実行します。  
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
     
```  
$ cd ~/
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh install_slackware.sh
```  
    
これでインストールは完了です。  
  
システムを再起動してください。  
```
$ sudo /sbin/reboot
```  
  
## ４．rfriends3の実行  

### 4.1 状態確認  

以下を確認してください。  
1040 atd のような表示が出なかったら、動作していません。  
  
```
$ pgrep -l atd
$ pgrep -l crond
$ pgrep -l smbd
$ pgrep -l lighttpd  
```  
  
### 4.2 実行  
  
以下を入力します。
```  
$ sudo /sbin/ifconfig | grep inet | grep -v inet6 | grep -v "127.0.0.1"  
inet 192.168.1.103  netmask 255.255.255.0  broadcast 192.168.1.255  
```  
このIPアドレス（この例では、192.168.1.103）がwebサーバアドレスです。  
  
ウェブブラウザ（edge,chrome,firefox,...）を起動し、上記で表示されたアドレスにアクセスする。  
  
http://192.168.1.103:8000  
  
以下のような画面が出たら成功です。ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
![2](https://github.com/user-attachments/assets/c4cc72cc-659c-4c29-bbfe-3f4951b9556c)
  
「ヘルプ」「システム更新」でシステムを最新にしてください。  
　
詳細な使用方法は、  
https://rfriends.github.io/rfriends/manual/  
を参照してください。   
  
## ５．samba  
  
　windowsの場合、エクスプローラに先ほどのIPアドレス(192.168.1.103)を入力すれば、録音ディレクトリにアクセスできます。smbdirというディレクトリが見えると思います。  
  
\\192.168.1.103
  
\\は￥￥です。  
  
スマホからでもファイルマネージャでアクセスできます。  
  
iPhoneの場合、ファイル - 3点リーダー - サーバー接続　smb://192.168.1.103　ゲストで接続できます。  
  
androidの場合も各種ファイルマネージャで可能です。（ファイルマネージャ＋推奨）  
  
![3](https://github.com/user-attachments/assets/d504cf68-0a3a-4701-92e5-199300647398)  
  
  
## ６．rfriends3のアンインストール  
  
・デイリー処理のために「設定」->「定期実行」->「登録」をしている場合は、必ず、「設定」->「定期実行」->「取消」をしてください。  
・次にrfriends3フォルダを削除してください。  
・これでアンインストールは終了です。  
  
  

以上  
