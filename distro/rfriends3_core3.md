## Linux版rfriends3でラジオ録音（その他）  
  
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
  
初 版　2024/02/23  
第34版　2026/06/05
  
## １．ディストリビューション  

下記のディストリビューションで動作確認しています。  
ダウロードサイトは[こちら](download.md)  
  
> [!CAUTION]  
> ~~2026/02/15現在、arch系はradiko,raiduの予約録音ができません。~~    
> ~~2026/02/16、仮対応しました。~~  
> インストールスクリプトに不具合あり。  
> 2026/06/05 対応完了。  
> 不具合等あれば、掲示板のほうにお願いします。  
  
|最終確認|判定|ディストロ|Ver.|備考|   
|---|:---:|---|---|---|  
|2026/06/05|〇|Arch linux|rolling|26.06.01|   
|2026/05/02|〇|Manjaro linux|rolling|26.0.4|   
|2026/06/05|〇|Cachy linux|rolling|26.04.26|   
|2026/06/05|〇|EndeavourOS|rolling|26.04.27|   
|2026/06/05|△|OmegaLinux|rolling|26.02.27 install時に文字化けするので△|   
  
## ２．インストール準備  
  
### 2.1 確認  
  
以下のことを確認してください。 
ほとんどのディストロでインストール時に設定可能です。  
 
1) システムを最新にし、アプリを追加する。  
2) 実行するユーザを追加し、管理者権限を付加する。  
3) その他   
  
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

### 2.2 Omega Linux  
  
Omega Linux以外は、2.3に進んでください。  
Omega Linuxの場合は、Englishでインストールして日本語化しないと文字化けします。

1) EnglishでOSをインストールします。
2) 日本語に変更します。
```　
sudo pacman -S noto-fonts-cjk noto-fonts-emoji ttf-vlgothic　
　
sudo nano /etc/locale.gen　
ja_JP.UTF-8 UTF-8　
　
sudo locale-gen　
sudo localectl set-locale LANG=ja_JP.UTF-8　
localectl status　
　
sudo pacman -S fcitx5-im fcitx5-mozc　
sudo nano /etc/environment　
GTK_IM_MODULE=fcitx　
QT_IM_MODULE=fcitx　
XMODIFIERS=@im=fcitx　
DefaultIMModule=fcitx　
  
sudo reboot  
```  
  
### 2.3 実行shは、install_arch.sh です。  

      
## ３．rfriends3のダウンロードとインストール  
  
　sshまたはTerminalを開き、sudoが可能なユーザでログインします。  
 
> [!CAUTION]
> 必ず２で確認したユーザでログインしてください。    
  
　ディストリビューション別のrfriends3インストールスクリプト（install_arch.sh）を実行します。  
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
$ sh install_arch.sh
```  
    
これでインストールは完了です。  
  
システムを再起動してください。  
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
  
> [!CAUTION]
> 日本語が文字化けする場合は、フォントをインストールしてください。  
> sudo pacman -S noto-fonts-cjk  
  
## ５．samba  
  
　windowsの場合、エクスプローラに先ほどのIPアドレス(xxx.xxx.xxx.xxx)を入力すれば、録音ディレクトリにアクセスできます。smbdirというディレクトリが見えると思います。  
  
\\XXX.XXX.XXX.XXX  
  
\\は￥￥です。  
  
スマホからでもファイルマネージャでアクセスできます。  
  
iPhoneの場合、ファイル - 3点リーダー - サーバー接続smb://xxx.xxx.xxx.xxx、ゲストで接続できます。  
  
androidの場合も各種ファイルマネージャで可能です。（ファイルマネージャ＋推奨）  
  
![3](https://github.com/user-attachments/assets/d504cf68-0a3a-4701-92e5-199300647398)  
  
## ６．カスタマイズ  
  
### 6.1 実行shをbashに変更したい場合　
```
chsh -s /bin/bash
```
　
### 6.2 日本語入力をしたい場合は　
```  
sudo pacman -S fcitx5-im fcitx5-mozc　
sudo nano /etc/environment
以下の4行を追加
GTK_IM_MODULE=fcitx　
QT_IM_MODULE=fcitx　
XMODIFIERS=@im=fcitx　
DefaultIMModule=fcitx　
  
sudo reboot  
```
  
### 6.3 firewallを有効化したい場合    
  
このスクリプトでは、firewallを無効化しています。  
有効化したい場合は、　
```　
#firewalldの場合  
sudo systemctl start firewalld  
sudo systemctl enable firewalld  
sudo firewall-cmd --add-service=ssh --permanent  
sudo firewall-cmd --add-service=samba --permanent   
sudo firewall-cmd --add-port=8000/tcp --permanent  
sudo firewall-cmd --reload
```  
  
#ufwの場合  
```  
sudo ufw allow ssh  
sudo ufw allow samba  
sudo ufw allow 8000/tcp  
sudo ufw enable   
```  
  
## ７．rfriends3のアンインストール  
  
・デイリー処理のために「設定」->「定期実行」->「登録」をしている場合は、必ず、「設定」->「定期実行」->「取消」をしてください。  
・次にrfriends3フォルダを削除してください。  
・これでアンインストールは終了です。  
  
  

以上  
