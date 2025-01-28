## ChromeOSのLinux開発環境にrfriends3をインストールする。  
  
　その名の通り、chromebook (ChromeOS) のLinux 開発環境でrfriends3を動かしてみました。Linux 開発環境はdebianなので、ほとんど既存のスクリプトで動作します。  
  
初 版　2024/03/27  
第5版　2025/01/29  
  
## １．実行環境  
  
　Panasonic Let's note CF-RZ4をchromebook化して検証しました。  
  
![20240330131502](https://github.com/user-attachments/assets/b41c2c7b-cbb4-4401-a200-b8feecea5650)  
  
debian bookworm (ChromeOS FLexのLinux開発環境)  
  
rfriends3 1.0.5  
lighttpd (Webサーバ)  
samba (ファイル共有)  
  
ssh,sftp  
at , cron  
  
## ２．準備  
  
　chromebookにLinux 開発環境をインストールしてください。  
  
Chromebook で Linux をセットアップする  
https://support.google.com/chromebook/answer/9145439?hl=ja  
  
設定ー詳細設定から行えます。  
  
![20240327025111](https://github.com/user-attachments/assets/222b2012-df92-4f15-956d-8e2e4d96f5e1)  
  
Linux開発環境のインストールが終了したら、次に、ターミナルを選択します。  
  
![20240327083853](https://github.com/user-attachments/assets/2c7af7c9-384f-4d3e-85c9-ab4a34f4c0df)  
  
penguinを選択します。  
![20240327025428](https://github.com/user-attachments/assets/d75175be-f0eb-4598-842d-1f0697fb7143)  
  
Linux 開発環境のターミナルが立ち上がります。  
   
![20240327083913](https://github.com/user-attachments/assets/81aa58ae-e2aa-4305-acaa-04f97b0d1d0d)  
   
以下、このターミナルで操作を行います。  
  
## ３．rfriends3のダウンロードとインストール  
  
　install用gitファイルをホームディレクトリにダウンロードします。各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
cd ~/  
sudo apt-get install git -y  
rm -rf rfriends3_core  
git clone https://github.com/rfriends/rfriends3_core.git  
cd rfriends3_core  
sh install_ubuntu.sh  
```  
  
　インストールには時間がかかりますが、気長にお待ちください。これでインストールは完了です。  
  
## ４．rfriends3の実行  
  
ChromeOSのウェブブラウザを起動し、localhostにアクセスする。  
```  
http://localhost:8000  
```  
以下のような画面が出たら成功です。lighttpdは正常に動作しています。  
   
![20240327030446](https://github.com/user-attachments/assets/2291f719-51d2-4734-a65b-2f76f90043e8)  
   
「ヘルプ」「システム更新」でシステムを最新にしてください。  
  
## ５．ポートの転送  
  
　Linux開発環境ではWell Known Port (0 - 1023)は使用できません。同一LAN内の他のPCからLinux開発環境にアクセスするには1023より大きなポート番号を割り当ててポートの転送を行う必要があります。  
　web,ssh,sambaのポート番号はインストール時にあらかじめ指定（8000,2022,4445）しています。設定のポート転送を開いて以下の3つを追加してください。  
  
![20240327033036](https://github.com/user-attachments/assets/f3cac18e-4aa0-40f0-ba01-ed02ea99b98b)  
  
また、chromebookのIPアドレスは、ここでは192.168.1.158と表示されていますが、実行しているchromebookにより異なります。ご自分の環境に合わせてください。  
  
## ６．他PCよりアクセス  
  
実行しているchromebookのIPアドレスをxxx.xxx.xxx.xxxとします。  
  
### ６．１　rfreiends3(lighttpd)  
  
他ｐｃのブラウザに以下を入力してください。rfriends3のWeb画面が表示されます。  
  
```  
http://xxx.xxx.xxx.xxx:8000  
```  
  
![20240327091822](https://github.com/user-attachments/assets/d7cce094-ba99-4ff5-8b1a-0a427a63fe03)  
  
### ６．２　sambaファイル共有  
  
他ｐｃのファイル管理ソフトに以下を入力してください。rfriends3の録音ディレクトリにアクセスできます。  
  
```  
smb://xxx.xxx.xxx.xxx:4445  
```  
  
Linuxからはファイルアプリ等で他の場所を選択してください。  
  
![20240327091845](https://github.com/user-attachments/assets/8229092e-bf6a-4c9a-82fe-cc08aa183067)  
  
また、スマホからでもファイルマネージャでアクセスできます。  
androidの場合も各種ファイルマネージャで可能です。（ファイルマネージャ＋推奨）  
  
![20240330124447](https://github.com/user-attachments/assets/1ca2157f-2434-482c-a9b1-34acff272a0b)  
  
![20240330124459](https://github.com/user-attachments/assets/6b45970c-d9f4-4d93-9e95-bf2ea266f57d)  
  
ただし、windowsの場合sambaのポート番号を変更できないため標準ではアクセスできません。Owlfilesというアプリを使えば可能になります。  
  
![20240327090624](https://github.com/user-attachments/assets/51dc1839-98fc-4098-8756-37817738f102)  
  
chromebookのIPアドレスとポート番号(4445)を入力してください。  
  
![20240327090635](https://github.com/user-attachments/assets/9e1c657b-aeeb-41b3-a3f2-b922c38cdf2d)  
  
rfriends3の録音ディレクトリにアクセスできます。  
   
![20240327090659](https://github.com/user-attachments/assets/e9473439-ea1a-4215-b507-7574581d52cb)  
   
iPhoneの場合も標準アプリでは変更できないので、Owlfilesアプリでアクセスします。匿名ではなくユーザ指定で行ってください。  
   
![20240330120058](https://github.com/user-attachments/assets/de8e22b9-2a7d-41f0-b0a2-1260f3ea20fb)  
   
### ６．３　sshアクセス  
  
他ｐｃよりSSHアクセスが可能です。ただし、chromebookのLinux開発環境側で事前に以下のことを行っておく必要があります。  
  
まずはsshを有効にするおまじない。  
  
```  
$ sudo rm /etc/ssh/sshd_not_to_be_run  
```  
  
ユーザのパスワードを設定する。  
  
```  
$ sudo passwd ユーザー名  
```  
  
/etc/ssh/sshd_configを編集する。とりあえずパスワードでアクセス。鍵認証がやりたい場合は別途行ってください。  
  
```  
$ sudo vi /etc/ssh/sshd_config  
Port 2022  
PasswordAuthentication yes  
```  
  
サービスの再起動を行う。  
  
```  
$ sudo systemctl restart sshd.service  
```  
  
これでようやく他PCよりSSHアクセスが可能になります。terminal等からsshアクセスしてください。  
  
```  
$ ssh ユーザ名@xxx.xxx.xxx.xxx:2022  
```  
  
![20240327092429](https://github.com/user-attachments/assets/1db521f3-c9bf-457c-a220-3bb1a7b3c282)  
  
### ６．４　sftpアクセス  
  
　sshアクセスが可能になるとsftpによりファイル転送も可能になります。  
PCよりWindowsならFilezilla等のアプリを使用してアクセスします。windows,macos,ios,android共通して使用できるアプリとしてはtermiusをお勧めします。  
  
ポート番号、ユーザ名、パスワードはsshと同一です。  
  
![20240329143218](https://github.com/user-attachments/assets/0a936726-712b-46bd-9d3b-a5d7193014e3)  
  
## ７．chromebookを再起動したとき  
  
　chromebookを再起動した場合、以下の２つの処理が必要です。  
  
・Linux 開発環境の起動  
  
・ポート転送をON  
  
スイッチがOFFになっているのでONにする。  
  
## ８．rfriends3のアンインストール  
  
　デイリー処理設定をしている場合は、必ず、「設定」->「定期実行」->「取消」をしてください。または、crontab -e です。  
次に、rfriends3フォルダを削除してください。  
  
これで、アンインストールは終了です。  
  
## ９．その他  
  
　ChromeOSのLinux 開発環境はかなり良く作られていると感じました。  
  
以上  
  
