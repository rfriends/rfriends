# Apple版rfriends3でラジオ録音  
    
  
> [!CAUTION]
> 現在開発中のため、インストールに関しては人柱状態です。  
> 正常に動作する保証はありません。  
  
iPhone/iPad/MacOS 用rfriends3はiSH Shellアプリにインストールして動作します。　  
cui,gui両モードをサポートしました。  
ただし、guiモードは現在不安定です。 
お試しと考えてください。  
  
<img width="600" height="564" alt="ish" src="https://github.com/user-attachments/assets/c09423b4-361a-4497-bc1c-ba4b1fa68b13" />  
  
初 版　2025/07/18   
九 版　2025/08/01  
  
## １．iSH Shell  
  
使用しているソフトウエアはiSH Shellで、ios上のlinux-like shell(alpine linux)です。  
ios 11 以上が必要です。MacOSでも動作しますが、M1以上のプロセッサが必要です。  
  
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
  
以下を入力します。  
```
# cd  
# rm ish  
# wget rf3.s331.xrea.com/ish  
# sh ish  
```
各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
また、cui,guiというshが作成されます。  
  
これでインストールは完了です。  
    
## ３．rfriends3の起動

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
  
### 3.3 update    
  
rfriends3を最新にアップデートしてください。  
  
rfriends3 Ver. 1.2.5-a06 以上  
  

## ４．samba  
  
　現在、未サポートです。  
  
## ５．rfriends3のアンインストール  
  
デイリー処理設定をしている場合は、必ず、「9-3」のデイリー処理で、rfriends3関連の設定を削除してください。  
または、crontab -e です。  
> [!CAUTION]
> システム関連の設定を消さないようにしてください。
  
rfriends3フォルダを削除してください。  
アンインストールは終了です。  
　　

## 補足１．トラブルシューティング
  
rfriends3の起動がうまくいかない場合は、以下を試してください。  
  
### 4.1 再起動  
  
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
  
# rc-update atd default
# rc-update local default
  
```
> [!CAUTION]
> 以下のようなエラーが出ますが無視してください。  
> grep: /proc/filesystems: No such file or directory


  
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
  
1) rfriends3 Ver. 1.2.5-a06 以上  
   
### 4.2 設定  
  
ファイルアプリでiSHの録音ファイルを参照するにはutf-8-mac形式である必要があります。    
以下の設定をすれば、見えるようになります。 
  
設定 - パラメータ  
```
;　番組名の濁点、半濁点を別にする  
;　no  LFR_＃みちょパラ_20250727_2230_2300.m4a  
;　yes LFR_＃みちょハ゜ラ_20250727_2230_2300.m4a  
;
; no  別にしない（推奨）  
; yes 別にする  
utf8_mac = "no"  
```
utf8_mac = "yes" を指定すれば、ファイル名がutf-8-mac対応になり、
ファイルアプリから参照、再生できるようになります。  
  
> [!CAUTION]
> なお、この設定をしても、フォルダおよびフォルダ内に日本語ファイルが残っていると参照できません。  
> また、ファイルアプリを使用しない場合は設定を変更しないでください
  
## 補足5．日本語の文字化け   
  
エディタとして、viを使用すると日本語が化けます。  
回避策として、vimまたはnanoを使用してください。  
  

  

  
  
以上  
