## Termux版rfriends3でラジオ録音    
  
余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　WindowsPCをラジオ録音のために24時間稼働させるのはちょっと大変ですよね。  
 そこで、 余ったandroidスマホ/タブレットでrfriendsを動かしてラジオ録音サーバにしようというものです。  
 もちろん余ってないものでもいいのですが普段使いのものとは分けたほうがいいとおもいます。  
 おすすめは、Amazon Fire Tablet + Bluetooth スピーカです。  
  
> [!IMPORTANT]
> インストール時にセキュリティ関連のアラームが表示されますが、基本は許可で進めてください。気になる方はインストールを中止してください。  
  
初版：2021/01/19  
改版：2026/08/12  
  
## １．Termuxのインストール   
  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット(OS7以上)  
androidOS7未満では動作しません。  
  
Termuxのインストール方法については、以下のリンクを参照してください。  
  
[Termuxのインストール方法](termux_inst.md)  
  
## ２．インストールスクリプトのダウンロード  
  
インストールスクリプトをダウンロードします。   
  
使用するスマホのブラウザでこのページを開き、以下の**リンクを長押し**して、インストールスクリプトをスマホのダウンロードディレクトリにダウンロードしてください。  
  
Github : [termux.sh](https://raw.githubusercontent.com/rfriends/rfriends_termux/main/termux.sh)    
または  
xrea : [termux.sh](https://ss1.xrea.com/rfbuddy.s296.xrea.com/storage/termux.sh)   
  
## ３．rfriends3のインストール  
  
### 3.1 Termuxの起動  
  
Termuxを起動してください。  
  
![3](https://github.com/user-attachments/assets/5b603b6c-b936-4f29-9ee4-c2445ece319a)  
  
  
これ以降は、Termux内での操作となります。  
  
![4b](https://github.com/user-attachments/assets/399dbc52-b091-4683-b1a0-ce0a47a7ad0f)  
    
### 3.2 インストールスクリプトの確認  
  
androidのダウンロードディレクトリにアクセスし、先ほど２．でダウン―ロードした termux.sh があることを確認します。  
    
```
$ cd
$ cd storage
$ cd downloads  
$ ls  
termux.sh  
```
  
### 3.3 ツールおよびrfriends3をインストールする  
  
インストールスクリプト(termux.sh)を実行する。  
  
```    
$ sh termux.sh  
```  
    
・途中、以下のメッセージが出たら、リターンキーを押してください。  

環境により異なりますが、3から4度くらい表示されます。  
  
![8](https://github.com/user-attachments/assets/d33da4b0-ad4c-4ba9-969e-fae1c69983e3)  
  
・インストールスクリプトの最後にtermux, sambaのパスワード入力を求められます。    

userはtermuxです。

```  
termuxのためのパスワードを設定してください
  
New password: ******* 
Retype new password: ******* 
New password was successfully set.
```
  
```  
sambaのためのパスワードを設定してください
  
New SMB password: *******
Retype new SMB password: ********
Added user termux.  
```  
  
### 3.4 サービス（atd, crond,sshd,lighttpd,smbd）およびwake-lockの有効化  
  
インストールスクリプトが完了したら、以下を入力して、サービスを有効化してください。  
  
```  
1. exit で termux を終了 (終了しないとサービスの有効化で失敗します。)    
2. 再度 termux を起動  
3. sh svenable.sh を実行  
```    
  
次のような画面が出たら、"許可"を押してください。これにより予約録音ができるようになります。  

![12](https://github.com/user-attachments/assets/85e21570-0565-4e83-a46d-f499effdb3da)  

  
また、ロック画面に以下のようなメッセージが表示されます。  
  
![13](https://github.com/user-attachments/assets/6484a8ca-92de-4b72-8895-8c965b4dae3d)  
  
wake-lockの有効化を行わないと、スマホがスリープしたときにTermuxも停止してしまい録音が中断されます。ただし、有効化した場合は、ACアダプタに接続しての運用を行ってください。スマホを再起動したときは再度確認が必要です。  
  
スクリプトが完了したら、以下のような画面が出ます。    
  
![9a](https://github.com/user-attachments/assets/3e616185-a053-473d-bf0c-b67bc3cfe938)  

  
上記アドレスをメモしてください。  
  
以上でrfriends3のインストールは完了です。Webサーバ（lighttpd）はすでに起動しています。  
  
## ４．rfriends3にアクセス  
  
### 4.1 rfriends3のWebサーバへのアクセス  
  
　androidスマホ自身または同一LAN に接続されたPC等からWEBブラウザ（chrome,edge,firefox等）で上記でメモした  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
  
![9](https://github.com/user-attachments/assets/4db21ecd-f876-4fac-8a65-19d1f28fe9d5)

### 4.2 チュートリアル  

まずは、チュートリアルでrfriends3の操作に慣れてください。  
  
[チュートリアル](https://rfriends.github.io/rfriends/manual/tutorial.html)  

### ５．録音ディレクトリ    
  
### 5.1 録音ディレクトリの設定（内部）  
  
　初期はスマホのダウンロードディレクトリに設定されています。通常はそのまま変更する必要はありません。  
  
rfriends3の画面で  
  
設定 - 録音フォルダ  
  
を選択し、録音データの格納場所を指定します。  
  
・スマホのダウンロードディレクトリの場合  
  
```  
usrdir=/data/data/com.termux/files/home/storage/downloads/usr2/  
tmpdir = ""  
```  
  
### 5.2 録音ディレクトリの設定（microSD）  
  
microSDを録音ディレクトリに設定する方法は、以下を参照してください。  
  
[Termux版rfriends3でmicroSDを使う](termux_microsd.md)
   
## ６．その他  

### 6.1 sambaアクセス  
    
  
以下の方法で、rfriends3の録音データにアクセスできます。  
  
sambaはポート4445で実行されています。  
IPアドレスを192.168.1.51として記述しています。  
  
#### 1) Linuxの場合  
  
アクセサリー - ファイル - 他の場所  
  
```  
smb://192.168.1.51:4445/smbdir/  
```  
  
接続  
  
#### 2) Androidの場合  
  
Owlfilesアプリはポートを変更できます。  
他にもファイルマネージャ＋、AndSMBで接続できました。  
  
![Screenshot_20260205-182120](https://github.com/user-attachments/assets/07be459c-08ef-4f30-a399-4500a67bbdd4)

  
右上の雷マーク - 新しい接続 - NAS  
  
![Screenshot_20260205-182102](https://github.com/user-attachments/assets/71711692-0fa1-4020-84df-ac23b0b1ff37)


  
保存（フロッピーアイコン）  
  
#### 3) Windowsの場合  
  
基本ポート445以外は接続できませんが、  
Windows11 24H2から代替ポートが指定出来るようになりました。  
  
PowerShell(管理者）を起動し、  
  
```  
PS > New-SmbMapping -LocalPath X: -RemotePath \\192.168.1.51\smbdir -TcpPort 4445 -password ******* -user termux

Status Local Path Remote Path
------ ---------- -----------
OK     X:         \\192.168.1.51\smbdir

PS C:\Users\user> x:
PS X:\> dir
```
  
これでドライブXで接続可能です。  
-LocalPath X: は、なくてもかまいません。  
  
また、エクスプローラから  
```
\\192.168.1.51/smbdir  
```
でアクセスできます。  
  
ステータスを見るには、    
```  
PS > Get-SmbMapping  
  
Status Local Path Remote Path  
------ ---------- -----------  
OK     X:         \\192.168.1.51\smbdir  
```  
また、接続を解除するには、  
```  
PS > Remove-SmbMapping -LocalPath X:  
  
確認  
この操作を実行しますか?  
ターゲット 'Close-Connection' で操作 'X:,\\192.168.1.51\smbdir' を実行しています。  
[Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "Y"):  
```  
  
#### 4) sambaディレクトリ  
  
sambaディレクトリは以下のファイルのpathを編集することにより変更できます。  
  
$ vi $PREFIX/etc/smb.conf  
  
```  
[smbdir]  
comment = termux share folder for rfriends  
path = /data/data/com.termux/files/home/storage/downloads/usr2/  
read only = no  
browsable = yes  
guest ok = yes  
force user = termux  
```  
  
編集後、サービスの再起動を行ってください。  
  
$ smbd -D -s $PREFIX/etc/smb.conf  
  
  
### 6.2 外部PCからのSSHアクセス  
  
外部からSSHアクセスをしない方は以下の操作は不要です。  
  
SSHアクセスのためのパスワードを設定してください。  
  
```  
$ passwd  
```  
  
これで、4.1で取得したIP アドレスを使って、ＰＣ等から  
  
```  
ssh -p 8022 hogehoge@XXX.XXX.XXX.XXX  
```  
  
でアクセスできます。hogehogeは任意です。  
  
teratermやRLoginを使用すると便利です。  
  
PCがLinuxでWARNINGが出て接続できないときはPCのホームディレクトリの.ssh/known_hostsを削除してみてください。  
  
### 6.3 sftpによるファイル転送  
  
　sshによるアクセスができたらPCでsftpによるファイル転送に挑戦してみましょう。  
  
ファイル転送ソフトでsftpに対応しているソフトをインストールしてください。ここでは、FileZillaを使用します。  
  
以下のように設定してください。IP アドレスは4.1で取得したもの、ユーザ名は任意です。  
  
![15](https://github.com/user-attachments/assets/3dd487fb-fccc-46bf-a21d-214d7e1e3148)  
  
成功すると以下のような画面になります。  
  
![16](https://github.com/user-attachments/assets/4a602a09-e98a-4289-942a-21b1c87c93c5)  
    
  
以上    
  
  
   
  
以上  
  
