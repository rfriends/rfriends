# ios版rfriends3でラジオ録音  
    
  
> [!CAUTION]
> 現在開発中のため、インストールに関しては人柱状態です。  
> 正常に動作する保証はありません。  
  
iPhone/iPad 用rfriends3はiSH Shellアプリにインストールして動作します。　  
cui,gui両モードをサポートしました。  
ただし、guiモードは現在不安定です。 
お試しと考えてください。  
  
<img width="600" height="564" alt="ish" src="https://github.com/user-attachments/assets/c09423b4-361a-4497-bc1c-ba4b1fa68b13" />  
  
初 版　2025/07/18   
九 版　2025/08/01  
  
## １．iSH Shell  
  
使用しているソフトウエアはiSH Shellで、ios上のlinux-like shell(alpine linux)です。  
ios 11 以上が必要です。MacOSでも動作するとの報告がありますが、M1以上のプロセッサが必要です。  
  
### 1) App StoreからiSHを入手し、インストールしてください。  

![IMG_0952](https://github.com/user-attachments/assets/0a0e4c4e-db3a-42c8-9a0b-711d20b54891)
  
> [!CAUTION]  
> iSHを削除して再インストールした場合、rfriends3がエラーになる場合があります。  
> その場合、再度iSHを削除して再インストールしてみてください。  
    
### 2) iSHをタップして起動します。 
  
<img width="200" height="200" alt="ish22" src="https://github.com/user-attachments/assets/819285e0-9d3b-4aa9-b6fb-3b6b19619bff" />  
  
  
### 3) 赤い矢印の指す「歯車」をタップします。
  
<img width="500" height="889" alt="open" src="https://github.com/user-attachments/assets/849cf0d6-c248-4719-bb2d-c8cfca24e694" />


  
「Keep Screen Turned ON」をONにします。  
「Done」をタップします。

<img width="500" height="889" alt="screen" src="https://github.com/user-attachments/assets/35b49485-9abc-45e4-998b-1830424b6909" />
  
その他、Appearanceで好みに応じて背景や文字サイズ等を設定してください。  
　　
### 4) キーボード  
  
標準で表示されるキーボードは以下のようなものです。  
  
![kb](https://github.com/user-attachments/assets/7c247f97-f8eb-4b1f-826b-49f59350e74d)  
   
文字キーボードの上に表示されるキーはそれぞれ以下の機能です。  
<img width="400" height="150" alt="ish10" src="https://github.com/user-attachments/assets/9a40bd0d-8883-4601-b45e-aa212e0e7975" />
    
bluetoothのキーボードを接続するとより快適になります。  
  
## ２．rfriends3のインストール  
  
### 2.1 インストールshのダウンロードと実行  
  
以下を入力します。  
  
```
# cd  
# rm ish  
# wget rf3.s331.xrea.com/ish  
# sh ish  
```
各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
また、cui,guiというshが作成されます。   
  
### 2.2 再起動  
  
iSHを終了します。  
  
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
  
![rebooy](https://github.com/user-attachments/assets/d276dacf-b814-49da-9482-37f485bb9c5e)  
  
また、初回起動時には、以下のような選択画面が表示されます。  
「Appの使用中は許可」を選択してください。(iPhoeとiPadでは画面が異なるようです)  
  
![loc](https://github.com/user-attachments/assets/998939c8-8ffc-48b2-aab2-f6ccee70bdc9)  
  
### 2.3 デーモンの確認    
  
psコマンドを入力してください。
```
# ps
```
  
![atd](https://github.com/user-attachments/assets/64969682-05c7-4c3b-b587-6689778553d3)  
  
以下の３つが表示されていることを確認してください。  
```
/usr/sbin/atd
crond
cat /dev/location
```  
  
これでインストールは完了です。  
    
## ３．rfriends3の起動
  
以下の３つの起動方法より選択してください。  
  
```  
3.1 cuiモード  
3.2 guiモード   
3.3 guiモード (他PCから)    
```  
    
起動後はrfriends3を最新にupdate してください。 
  
### 3.1 cuiモード  
  
1) rfriends3をcuiモードで起動します。  
  
```  
# cd  
# sh cui  
```  
  
2) 以下のような画面が表示されれば成功です。  
  
![IMG_0949](https://github.com/user-attachments/assets/528dc96e-6bcd-4d08-ab05-7f4779e928a1)  
   
少々古いですが、CUIモードのマニュアルとしては、こちらのほうが参考になります。  
[rfriends2操作マニュアル](http://ceres.s501.xrea.com/wp_rfriends/index.php/manual/)   
  
> [!CAUTION]  
> エディタとして、viを使用すると日本語が化けます。  
> 回避策として、vimまたはnanoを使用してください。
  
### 3.2 guiモード    
  
1) rfriends3をguiモードで起動します。  
  
```  
# cd  
# sh gui  
```
   
2) 以下のような画面が表示されます。  
  
![IMG_0950](https://github.com/user-attachments/assets/94de7c08-035e-4cb8-a8a7-495813131b8d)
  

3) 次に、rfriends3をインストールしているiPhoneで、safariブラウザを立ち上げ、  
```
localhost:8000
```
と入力します。 
  
4) 以下のような画面が表示されれば成功です。  
  
![rf3](https://github.com/user-attachments/assets/223adaad-251a-41ad-8d01-0fd4c47bc533)
  
詳細な使用方法は、  
[rfriendsのマニュアル](https://rfriends.github.io/rfriends/manual/)    
を参照してください。    
  
> [!CAUTION]  
> 現在、guiモードは不安定のため、Development Server がしばしばダウンします。  
> その際はiPhone/iPadで、ctrl-cで終了させ、再び  
> sh gui  
> を実行してください。
  
## 3.3 guiモード (他PCから)  
  
1) iSHを実行しているiPhone/iPadのIPアドレスを確認します。  
  
ios-設定-WiFi-(i)で確認してください。  
iSHでは認識できません。  
<img width="600" height="280" alt="ish20" src="https://github.com/user-attachments/assets/c3a17c31-64c3-49e8-8711-0306afd505e4" />

2) rfriends3をguiモードで起動します。  
  
以下を入力します。  
```  
# cd
# sh gui IPアドレス:8000
```

3) Webブラウザの実行
iPhone/iPad/Mac/PC等のブラウザから
```  
http://IPアドレス:8000
```
でアクセス。  
以下のような画面が出れば成功です。  
<img width="600" height="476" alt="ish21" src="https://github.com/user-attachments/assets/539e3a02-911e-4c9d-93a7-9f70f61cd0e9" />
  
  
## ４．samba  
  
　現在、未サポートです。  
  
## ５．rfriends3のアンインストール  
  
デイリー処理設定をしている場合は、必ず、「9-3」のデイリー処理で、rfriends3関連の設定を削除してください。  
または、crontab -e です。  
> [!CAUTION]
> システム関連の設定を消さないようにしてください。
  
rfriends3フォルダを削除してください。  
アンインストールは終了です。  
  
## 補足1．iSH ShellにSSHアクセス  
  
> [!CAUTION]  
> rootによるsshアクセスに不安がある方は以下の設定を行わないでください。  
    
### 1.1 前提条件  
  
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

  
### 1.2 sshdの設定  
  
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
  
### 1.3 他クライアントからSSHアクセス  
  
お好きなSSHクライアント(teraterm,rlogin,putty,windows powershell等)から  
  
iSHを実行しているiPHone/iPadのIPアドレス  
ポート番号  
root/設定したパスワード

## 補足2．iSH ShellにSCPアクセス  
  
### 2.1 前提条件  
  
1) 補足2．iSH ShellにSSHアクセスができていること
   
### 2.2 インストールと実行  
  
2) win-scpのインストール(Windowsの場合)
  
3) 以下のような設定でアクセスできます。   
   
<img width="600" height="392" alt="scp" src="https://github.com/user-attachments/assets/f8806e7e-2a6c-4b1c-b02e-9fbb8d52a48e" />
   
4) あとは自由にファイルのコピーが可能になります。   
 

  

  

  
  
以上  
