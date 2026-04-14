## rfriends3のdelivery機能にssh copyを追加する。  
  
初版 2026/03/18  
  
delivery機能とは、radiko/radiruの録音時に任意のディレクトリにデータをcopy/moveする機能です。  
キーワード - 番組配送で設定できます。  
  
今回はこれに、ssh serverが動作している他PCへのcopy/move機能を追加しました。  
  
  
### １．クライアント側  
  
rfriends3を実行しているPCでの設定です。  
phpのssh2 extensionをインストールします。   
その後、Webサーバー（lighttpdなど）を再起動します。  
  
#### 1.1 ubuntu/debian系の場合  
  
~~~  
$ sudo apt update  
$ sudo apt-get install libssh2-1  
$ sudo apt install php-ssh2  
~~~  
  
以下を実行し、ssh2と表示されたら、インストール完了です。  
  
~~~  
$ php -m | grep ssh2  
ssh2  
~~~  
  
#### 1.2 CentOS/RHEL系の場合  
  
> Caution  
> 現在、未確認  
  
~~~  
$ sudo yum -y install libssh2 libssh2-devel  
$ sudo pecl install -f ssh2  
$ echo "extension=ssh2.so" > /etc/php.d/ssh2.ini  
~~~  
  
#### 1.3 Windowsの場合  
  
新規インストール時にrfriends3 3.1.6以降だった場合は、  
設定済ですので以下は不要です。  
  
1) PHPのversionを確認  
  
ヘルプ - rfriendsについて - 使用ソフトウエアで  
  
~~~  
friends は以下のソフトウエアを使用しています。   
   
PHP 8.1.12 (cli) (built: Oct 25 2022 18:16:21) (ZTS Visual C++ 2019 x64)   
~~~  
  
以下のZIPファイルををダウンロードする。  
  
~~~  
https://downloads.php.net/~windows/pecl/releases/ssh2/1.4.1/  
php_ssh2-1.4.1-8.1-ts-vs16-x64.zip  
~~~  
  
解凍し、DLLを  
rfriends3/bin/php/ext  
にコピーする。  
  
php.iniにextensionを追加する。  
  
~~~  
rfriends3/bin/php/php.ini  
extension=ssh2   
~~~  
  
  
### ２．サーバ側  
  
録音データをコピーするPC側の設定です。  
  
ssh serverが起動していれば、特にすることはありません。  
  
ただし、クライアントのPHPが7.4等古い場合、ssh_connectがエラーになります。  
その場合は、以下の設定をしてください。  
  
sshd_configの最後に以下の2行を追加する。  
  
~~~  
$ sudo vi /etc/ssh/sshd_config  
  
PubkeyAcceptedAlgorithms +ssh-rsa   
HostKeyAlgorithms +ssh-rsa  
~~~  
  
sshdを再起動する。  
  
~~~  
$ sudo systemctl restart sshd  
~~~  
  
### ３．delivery機能の設定  
  
キーワード - 番組配送、を開き設定を行います。  
従来の自PCの場合は、以下のようになります。  
  
例：「深夜の馬鹿力」を/home/rpi/smbdir/user1/radiko/にコピーする。  
  
~~~  
:dlvy  
on  
#  
:dlvy_users  
user1  
#  
:dlvy_user1_radiko_dir  
/home/rpi/smbdir/user1/radiko/  
#  
:dlvy_user1_radiko_copy  
TBS,JUNK,深夜の馬鹿力  
~~~  
  
これに、user2を追加し、ssh serverにコピーします。  
例：「オールナイトニッポン」を192.168.1.100の/home/hoge/radiko/にコピーする。  
  
sshサーバ:192.168.1.100  
ユーザ: hoge  
パスワード:pass  
  
~~~  
:dlvy_users  
user1  
user2  
#  
:dlvy_user2_radiko_dir  
/home/hoge/radiko  
ssh  
192.168.1.100  
hoge,pass  
#  
:dlvy_user2_radiko_copy  
LFR,オールナイトニッポン  
~~~  
  
通常の設定と違う点は以下の個所のみです。  
  
ssh  
192.168.1.100  
hoge,pass  
  
  
### ４．その他  
  
  
以上  
