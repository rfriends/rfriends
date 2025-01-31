## Linux版rfriends3でラジオ録音  
  
rfriends2はCLIベースでしたが、rfriends3はWEBベースで操作が簡単になっています。  
webサーバにlighttpd、ファイル共有にsambaを採用したLinux版です。(ubuntu/debian/stream9/rocky/arch/chrome)  
インストールは全自動で行います。  
     
![1](https://github.com/user-attachments/assets/38b186a6-e203-43b2-a2d9-27e2d07aae42)
  
初 版　2024/02/23  
第9版　2025/01/29  
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
  
|確認日付|ディストロ|実行シェル|    
|---|---|---|  
|2025/01/24|ubuntu|install_ubuntu.sh|  
|2025/01/24|debian|install_ubuntu.sh|  
|2025/01/24|stream9|install_stream9.sh|  
|2025/01/24|rocky linux|install_stream9.sh|  
|2025/01/24|arch linux|install_arch.sh|   
|2025/01/24|chromeos linux環境|install_ubuntu.sh|   
  
## ２．確認事項  
  
　以下を確認し、インストール可能かどうかを判断してください。  
  
ubuntuであれば、Ver.22.04以上  
debianであれば、Version11(bullseye)以上  
をお勧めします。(ubuntu 20.04やdebian busterでも動作します)  
  
sudoが可能なユーザ  
実行ユーザにsudo権限があること。  
```  
$ groups ユーザ名  
```  
表示されるグループ名の中にsudoがあることを確認してください。 ない場合は、rootで権限を付加してください。  
```  
# gpasswd -a ユーザ名 sudo  
```  
タイムゾーンと現在時刻の確認  
```  
$ date  
Sun 25 Feb 2024 07:06:16 AM JST  
```  
でタイムゾーンを確認してください。 末尾がJSTになっていなかったら、   
```  
$ timedatectl set-timezone Asia/Tokyo   
```  
で日本に変更してください。 これを忘れると、予約録音が始まりません。  
その後、再び時刻が正しいことを確認してください。  
```  
$ date  
Sun 25 Feb 2024 07:07:16 AM JST  
```  
システムのアップデート  
まれに失敗する環境の場合、以下をおこなってください。通常は不要です。  
```  
　$ sudo apt-get update  
　$ sudo apt-get upgrade -y  
　$ sudo reboot  
```  
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能な任意のユーザでログインします。  
  
　ディストリビューション別のrfriends3インストールスクリプトを実行します。各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
$ cd ~/
$ sudo apt-get -y install git  
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh instal_XXXXX.sh  
```  
  
これでインストールは完了です。  
  
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
