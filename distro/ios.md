## ios版rfriends3でラジオ録音  
  
！！！開発中　執筆途中！！！  

> [!CAUTION]
> 現在、インストールに関しては人柱状態です。  
> 正常に動作する保証はありません。  
  
iPhone/iPad 用rfriends3はiSH Shellアプリにインストールして動作します。　  
~~現在は、CLIモードでの動作しかしませんが、近い将来、GUIモード（ブラウザアクセス）もサポート予定です。~~  
cui,gui両モードをサポートしました。  
ただし、guiモードは現在不安定です。 
お試しと考えてください。  
   
<img width="600" height="564" alt="ish" src="https://github.com/user-attachments/assets/c09423b4-361a-4497-bc1c-ba4b1fa68b13" />

  
初 版　2025/07/18   
六 版　2025/07/27   
  
## １．iSH Shell　ソフトウエア  
  
使用しているソフトウエアはiSH Shellで、ios上のlinux-like shell(alpine linux)です。  
ios 11 以上が必要です。  
  
iSH Shellのインストールは以下から可能です。  
[download](https://apps.apple.com/jp/app/ish-shell/id1436902243)  
  
また、iSH Shell のサイトは以下のとおり。  
[github](https://github.com/ish-app/ish/)  
  
## ２．インストール準備  
以下のことを確認してください。 
 
1) iSH Shellをインストールする。  
2) iSH Shellを設定する。  
  
・画面右下の(i)をタップする。    
  
<img width="236" height="119" alt="ish3" src="https://github.com/user-attachments/assets/ff8c201d-da81-45c0-af51-bdd2fa7f2c09" />  
  
・Keep Screen Turned OnをONにする。  
  
<img width="600" height="290" alt="ish2" src="https://github.com/user-attachments/assets/53220add-6b12-4afe-9c79-51d813371159" />  
  

その他、Appearanceで好みに応じて背景や文字サイズ等を設定してください。  
  
3) 以下のコマンドを実行する。  

```  
# apk update
# apk upgrade

# apk add sudo
# apk add git
```
> [!CAUTION]
> iSHを削除して再インストールした場合、update/upgradeがエラーになる場合があります。  
> その場合、再度iSHを削除して再インストールしてみてください。  
  
 
## ３．rfriends3のダウンロードとインストール  
  
　iSH Shellを実行します。  
 
> [!CAUTION]
> 現在はrootで実行しますが、
> 将来的にはユーザモードで実行するようにします。
    
  
　rfriends3インストールスクリプト（install_ish.sh）を実行します。    
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
# cd ~/
# rm -rf rfriends3_core   
# git clone https://github.com/rfriends/rfriends3_core.git  
# cd rfriends3_core  
# sh install_ish.sh
```  
  
これでインストールは完了です。  
再起動してください。  
```
# exit
```
その後、一旦iSHを強制終了し、再度起動してください。 
```
強制終了（AI による概要）

iPhoneでアプリを強制終了するには、まずアプリスイッチャーを開き、終了したいアプリを上にスワイプします。
アプリスイッチャーは、ホームボタンがある機種ではホームボタンの2回押し、
Face ID搭載機種では画面下部から上にスワイプして中央で停止することで表示されます。
アプリを強制終了しても、アプリが削除されるわけではありません。
```
  
> [!CAUTION]  
> iosの場合、exit では真の再起動にはならないため、強制終了が必要です。  
  
再起動すると、以下のような画面になります。  
<img width="600" height="450" alt="ish6" src="https://github.com/user-attachments/assets/25c76549-2c32-40a1-adab-06a069c4f492" />
  
また、初回起動時には、以下のような選択画面が表示されます。  
このAppの使用中のみ許可/常に許可を選択してください。(iPhoeとiPadでは画面が異なるようです)  
<img width="600" height="600" alt="ish10" src="https://github.com/user-attachments/assets/34108bee-1ec5-4de0-8413-093f7a10246b" />
  
次に、psコマンドを入力してください。
```
# ps aux
```
<img width="600" height="450" alt="ish7" src="https://github.com/user-attachments/assets/c14e01cb-d451-41e3-af93-19c12400d55f" />

以下の３つが表示されていることを確認してください。  
```
/usr/sbin/atd
crond
cat /dev/location
```
もし、表示されていない場合は以下を実行し、再度psコマンドで確認してください。  
```
# rc-service atd restart
# rc-service local restart
```
> [!CAUTION]
> 以下のようなエラーが出ますが無視してください。  
> grep: /proc/filesystems: No such file or directory
  
## ４．rfriends3の実行  
  
### 4.1 cuiモード  
  
以下を入力します。  
```  
# cd
# cd rfriends3
# sh rfriends3.sh
```  
  
以下のような画面が出たら成功です。  
<img width="600" height="450" alt="ish4" src="https://github.com/user-attachments/assets/86fbc1c8-e9bd-4008-a0c2-e8da8d57829d" />

  
「10-1」でシステムを最新にしてください。（1.2.4 以上）  


少々古いですが、CUIモードのマニュアルとしては、こちらのほうが参考になります。  
[rfriends2操作マニュアル](http://ceres.s501.xrea.com/wp_rfriends/index.php/manual/)

### 4.2 guiモード  
  
1) iPhone/iPadのIPアドレスを確認
  
ios-設定-WiFi-(i)で確認してください。  
iSHでは認識できません。  
<img width="600" height="280" alt="ish20" src="https://github.com/user-attachments/assets/c3a17c31-64c3-49e8-8711-0306afd505e4" />

2) Development Server の実行
  
以下を入力します。  
```  
# cd
# cd rfriends3
# sh rfriends3_server.sh IPアドレス:8000
```

3) Webブラウザの実行
iPhone/iPad/Mac/PC等のブラウザから
```  
http://IPアドレス:8000
```
でアクセス。  
以下のような画面が出れば成功です。  
<img width="600" height="476" alt="ish21" src="https://github.com/user-attachments/assets/539e3a02-911e-4c9d-93a7-9f70f61cd0e9" />
  
詳細な使用方法は、  
https://rfriends.github.io/rfriends/manual/  
を参照してください。    
  
> [!CAUTION]
> 現在、guiモードは不安定のため、Development Server がしばしばダウンします。  
> その際はiPhone/iPadで、ctrl-cで終了させ、再び  
> sh rfriends3_server.sh IPアドレス:8000  
> を実行してください。   
  
## ５．samba  
  
　現在、未サポートです。  
  
## ６．rfriends3のアンインストール  
  
デイリー処理設定をしている場合は、必ず、「9-3」のデイリー処理で、rfriends3関連の設定を削除してください。  
または、crontab -e です。  
> [!CAUTION]
> システム関連の設定を消さないようにしてください。
  
rfriends3フォルダを削除してください。  
アンインストールは終了です。  

## 補足１．キーボード  
  
標準で表示されるキーボードは以下のようなものです。  
<img width="600" height="450" alt="ish9" src="https://github.com/user-attachments/assets/de7d0221-aac3-458b-a19b-b68a2ada1aa1" />
  
文字キーボードの上に表示されるキーはそれぞれ以下の機能です。  
<img width="400" height="150" alt="ish10" src="https://github.com/user-attachments/assets/9a40bd0d-8883-4601-b45e-aa212e0e7975" />
    
bluetoothのキーボードを接続するとより快適になります。  
  
## 補足2．iSH ShellにSSHアクセス  
  
> [!CAUTION]  
> rootによるsshアクセスに不安がある方は以下の設定を行わないでください。  
    
### 2.1 前提条件  
  
1) opensshがインストール済  
  \# apk add openssh  
  
2) rootでログイン  
現在rootで操作のため  
  
3) rootのパスワード設定済  
  \# passwd  
  
4) パスワード認証  
公開鍵で認証したい方は別途、設定を行ってください。  
  
5) ポート番号:20022  
22 -> 20022  
番号は自由に決めて下さい  
  
6) iPhone/iPadのIPアドレス  
ios-設定-WiFi-(i)で確認してください。
iSHでは認識できません。
<img width="600" height="280" alt="ish20" src="https://github.com/user-attachments/assets/c3a17c31-64c3-49e8-8711-0306afd505e4" />

  
### 2.2 sshdの設定  
  
1) /etc/ssh/sshd_configの設定   
  \# cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org  
  \# vi /etc/ssh/sshd_config   
    
以下の3か所を変更する。  
   
```
#Port 22  
Port 20022  
  
#PermitRootLogin prohibit-password  
PermitRootLogin yes  
  
#PasswordAuthentication yes  
PasswordAuthentication yes  
```
    
2) ホストキーの設定  
  \# ssh-keygen -A  
  
3) sshdの開始  
  \# rc-service sshd start
  
　以下のようなエラーが出ますが無視で。  
  grep: /proc/filesystems: No such file or directory  
    
5) ishの初期起動時にsshdの自動開始   
  \# rc-update add sshd  
  
### 2.3 他クライアントからSSHアクセス  
  
お好きなSSHクライアント(teraterm,rlogin,putty,windows powershell等)から  
  
iSHを実行しているiPHone/iPadのIPアドレス  
ポート番号  
root/設定したパスワード

## 補足3．iSH ShellにSCPアクセス  
  
### 3.1 前提条件  
  
1) 補足2．iSH ShellにSSHアクセスができていること
   
### 3.2 インストールと実行  
  
2) win-scpのインストール(Windowsの場合)
  
3) 以下のような設定でアクセスできます。   
   
<img width="600" height="392" alt="scp" src="https://github.com/user-attachments/assets/f8806e7e-2a6c-4b1c-b02e-9fbb8d52a48e" />
   
4) あとは自由にファイルのコピーが可能になります。   

## 補足4．ファイルアプリからのアクセス  
  
### 4.1 前提条件  
  
rfriends3のバージョンが1.2.5-a01以上  
  
### 4.2 設定  
  
iSHアプリの日本語ファイル対応に不具合があるため、ファイルアプリから録音結果が見えません。  
以下の設定をすれば、見えるようになります。 
  
設定 - パラメータ  
```
;　番組名を省略する
;　0 SixTONESのオールナイトニッポンサタデースペシャル_20250726_2330
;　1 SixTONES_20250726_2330
;　2 -_20250726_2330
; 0 省略しない（推奨）
; 1 ASCII以外を削除する
; 2 省略する
fname_omit = 0
```
$fname_omit = 1 を指定すれば、ファイル名がアスキーのみとなり  
ファイルアプリから参照、再生できるようになります。  
  
> [!CAUTION]
> なお、この設定をしても、フォルダ内に日本語ファイルが残っていると参照できません。  
> また、ファイルアプリを使用しない場合は設定を変更しないでください。

## 補足5．日本語の文字化け   
  
エディタとして、viを使用すると日本語が化けます。  
回避策として、vimまたはnanoを使用してください。  
  

  

  
以上  
