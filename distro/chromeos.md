## ChromeOSのLinux開発環境版friends3でラジオ録音  
  
　その名の通り、chromebook (ChromeOS) のLinux 開発環境でrfriends3を動かしてみました。  
 Linux 開発環境はdebianなので、ほとんど既存のスクリプトで動作します。  
  
初 版　2024/03/27  
第5版　2025/01/29  
  
## １．実行環境  
  
　Panasonic Let's note CF-RZ4をchromebook化して検証しました。  
  
![1](https://github.com/user-attachments/assets/7aafcfc9-0145-4be9-97c6-440dbfe99c15)  
  
debian bookworm (ChromeOS FLexのLinux開発環境)  
  
rfriends3 1.0.5  
lighttpd (Webサーバ)  
samba (ファイル共有)  
  
ssh,sftp  
at , cron  
  
## ２．準備  
  
　chromebookにLinux 開発環境をインストールしてください。  
  
Chromebook で Linux をセットアップする  
[Chromebook で Linux をセットアップする](https://support.google.com/chromebook/answer/9145439?hl=ja)    
  
設定ー詳細設定から行えます。  
  
![2](https://github.com/user-attachments/assets/8e6433bb-5e07-462c-bad8-fb81bf94bd6a)  
   
Linux開発環境のインストールが終了したら、次に、ターミナルを選択します。  
  
![3](https://github.com/user-attachments/assets/84ac89b2-187e-4caf-84a4-10b3fdfd80e4)  
  
penguinを選択します。  
  
![4](https://github.com/user-attachments/assets/92afb5a4-b780-46d5-9fed-420140f0f04d)  
  
Linux 開発環境のターミナルが立ち上がります。  
  
![5](https://github.com/user-attachments/assets/69bd20bd-5a1b-45d7-8e5c-f7f19750c6af)  
  
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
   
![6](https://github.com/user-attachments/assets/4c981d8c-453a-4796-874f-3d4dbb35fbe7)  
   
「ヘルプ」「システム更新」でシステムを最新にしてください。  
  
## ５．ポートの転送  
  
　Linux開発環境ではWell Known Port (0 - 1023)は使用できません。同一LAN内の他のPCからLinux開発環境にアクセスするには1023より大きなポート番号を割り当ててポートの転送を行う必要があります。  
　web,ssh,sambaのポート番号はインストール時にあらかじめ指定（8000,2022,4445）しています。設定のポート転送を開いて以下の3つを追加してください。  
  
![7](https://github.com/user-attachments/assets/7f87254b-f6c7-4e30-8f53-7de3faf1ea86)  
  
また、chromebookのIPアドレスは、ここでは192.168.1.158と表示されていますが、実行しているchromebookにより異なります。ご自分の環境に合わせてください。  
  
## ６．他PCよりアクセス  
  
実行しているchromebookのIPアドレスをxxx.xxx.xxx.xxxとします。  
  
### ６．１　rfreiends3(lighttpd)  
  
他ｐｃのブラウザに以下を入力してください。rfriends3のWeb画面が表示されます。  
  
```  
http://xxx.xxx.xxx.xxx:8000  
```  
  
![8](https://github.com/user-attachments/assets/f5f0ae78-3db1-4436-b33c-a3a7d55b8c1e)  
  
### ６．２　sambaファイル共有  
  
他ｐｃのファイル管理ソフトに以下を入力してください。rfriends3の録音ディレクトリにアクセスできます。  
  
```  
smb://xxx.xxx.xxx.xxx:4445  
```  
  
Linuxからはファイルアプリ等で他の場所を選択してください。  
  
![9](https://github.com/user-attachments/assets/87309a72-3d81-4b3d-9748-a5d2907203b2)  
  
また、スマホからでもファイルマネージャでアクセスできます。  
androidの場合も各種ファイルマネージャで可能です。（ファイルマネージャ＋推奨）  
  
![10](https://github.com/user-attachments/assets/c2dfedeb-98aa-4917-b784-fd17a8ee6326)  
  
![11](https://github.com/user-attachments/assets/838d3eb5-14eb-43f2-8350-6b3b39aba4e5)  
  
ただし、windowsの場合sambaのポート番号を変更できないため標準ではアクセスできません。Owlfilesというアプリを使えば可能になります。  
  
![12](https://github.com/user-attachments/assets/5747133a-aad0-4062-82da-80f02b85d975)  
  
chromebookのIPアドレスとポート番号(4445)を入力してください。  
  
![13](https://github.com/user-attachments/assets/f9dbf60a-e5fa-453f-a56b-c2af6963ff09)  
  
rfriends3の録音ディレクトリにアクセスできます。  
  
![14](https://github.com/user-attachments/assets/c40b0037-bcc9-4dc3-97f4-b417113b07c5)  
  
iPhoneの場合も標準アプリでは変更できないので、Owlfilesアプリでアクセスします。匿名ではなくユーザ指定で行ってください。  
   
![15](https://github.com/user-attachments/assets/e8b85b6d-4628-4aba-aba1-ca67b89b5ed0)  
  
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
  
![16](https://github.com/user-attachments/assets/869fd9e0-6a2f-4285-8ca5-5a105eef00e5)  
  
### ６．４　sftpアクセス  
  
　sshアクセスが可能になるとsftpによりファイル転送も可能になります。  
PCよりWindowsならFilezilla等のアプリを使用してアクセスします。windows,macos,ios,android共通して使用できるアプリとしてはtermiusをお勧めします。  
  
ポート番号、ユーザ名、パスワードはsshと同一です。  
  
![17](https://github.com/user-attachments/assets/21489efb-c114-420c-8f3d-7f1477786fa1)  
  
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
  
