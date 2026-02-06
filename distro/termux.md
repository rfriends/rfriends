## Termux版rfriends3でラジオ録音  
  
余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　WindowsPCをラジオ録音のために24時間稼働させるのはちょっと大変ですよね。そこで、 余ったandroidスマホ/タブレットでrfriendsを動かしてラジオ録音サーバにしようというものです。もちろん余ってないものでもいいのですが普段使いのものとは分けたほうがいいとおもいます。  
  
> [!IMPORTANT]  
> インストール時にセキュリティ関連のアラームが表示されますが、基本は許可で進めてください。気になる方はインストールを中止してください。  
  
初版：2021/01/19  
改版：2026/02/06
  
## １．準備  
  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット(OS5.0以上)  
  
androidOS5.0未満では動作しません。  
  
以下の**リンクを長押し**して、インストールスクリプトをスマホのダウンロードディレクトリにダウンロードしてください。  
  
[termux.sh](https://raw.githubusercontent.com/rfriends/rfriends_termux/main/termux.sh)    

途中以下のようなメッセージが表示されます。  
  
・リンクをダウンロードを選択  
![1a](https://github.com/user-attachments/assets/a01dc09e-189f-4886-9c5b-cbbe2e6c5228)  

・ダウンロードを続行  
![1b](https://github.com/user-attachments/assets/2ccce8cf-f0eb-49c2-8fd0-17520d1fdcb3)  

・ダウンロードが完了  
![1c](https://github.com/user-attachments/assets/b0b4642a-f4a8-4207-8296-ff0f3469ade9)  


  
## ２．Termuxのインストール   
  
Termuxは、AndroidやChrome OS上でLinux環境を実行できるターミナルエミュレータアプリです。  
    
### 2.1 Termuxのダウンロード  
  
　以下のリンクよりスマホのダウンロードディレクトリにtermuxをダウンロードしてください。  
  
2026/01/30のバージョンは0.118.3(1002) です。 
beta版0.119.0-beta.3(1022)はインストールしないでください。  
  
Github  
~~<https://github.com/termux/termux-app/releases>~~  
~~[termux.apk](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.1/termux-app_v0.119.0-beta.1+apt-android-7-github-debug_universal.apk)~~  
    
F-droid  
  
<https://f-droid.org/ja/packages/com.termux/>  
  
<https://f-droid.org/repo/com.termux_1002.apk>  
  
### 2.2 Termuxのインストール  
  
1) ファイルマネージャを起動し、ダウンロードディレクトリにあるcom.termux_1020.apkをタップしてtermuxをインストールしてください。  
   
![1](https://github.com/user-attachments/assets/cde2403e-6c3a-49dc-9ea8-b38e3ab05249)  

2) "詳細"を押して下さい。（androidのバージョンにより画面は異なります）  
  
![2](https://github.com/user-attachments/assets/6581f35d-fb4f-4098-9481-81aff365e414)  
  
3) "インストールする"を押してください。 
  
![3](https://github.com/user-attachments/assets/f3087eb2-28e4-45c2-8ab1-754dab5fd244)  
  
4) このような画面が出たら、**必ず** "許可"を押してください。
  
![4](https://github.com/user-attachments/assets/348b495f-60ba-43b9-b79c-9d3b7f8a3dfe)  
  
5) これでtermuxのインストールは完了です。
  
![4a](https://github.com/user-attachments/assets/0166b778-e8af-4e36-908c-874d42435f0d)  
  
## ３．rfriends3のインストール  
  
### 3.1 Termuxの起動  
  
Termuxを起動してください。  
  
![3](https://github.com/user-attachments/assets/5b603b6c-b936-4f29-9ee4-c2445ece319a)  
  
  
これ以降は、Termux内での操作となります。  
  
![4b](https://github.com/user-attachments/assets/399dbc52-b091-4683-b1a0-ce0a47a7ad0f)  
    
### 3.2 termux-setup-storageの実行  
  
1) これにより、termuxからandroid側のファイルにアクセスできるようになります。  
  
```
$ termux-setup-storage
```
  
全てのファイルの管理権を付与する。  
  
![5](https://github.com/user-attachments/assets/e9232282-ed0f-43af-8bc8-4ae552fc3c9f)  
    
2) androidのダウンロードディレクトリにアクセスし、termux.shがあることを確認します。  
    
```
$ cd
$ cd storage
$ cd downloads  
$ ls  
com.termux_1020.apk termux.sh  
```
  
### 3.3 ツールおよびrfriends3をインストールする  
  
#### 3.3.1 termux.shを実行する。  
  
```    
$ sh termux.sh  
```  
    
#### 3.3.2 termuxのミラーサイトを変更する。   
  
termux.shの実行途中で、ミラーをグループにするかシングルにするかの選択画面が出ますが、そのままOKを選択してください。  
  
![6](https://github.com/user-attachments/assets/5b1d1d3b-7d0b-40d1-afcf-30b2df66c927)  
  
ミラーグループの選択画面が出ますが、そのままOKを選択してください。   
  
![7](https://github.com/user-attachments/assets/ff6f0023-6942-4283-bb4e-6c1db1354fbb)  
  
> [!CAUTION]  
> その後、ミラーサイトのチェックが行われますが  
> Error: None of mirrors are accessable  
> のようなメッセージが出た場合はミラーサイトがすべてダウンしているので、  
> しばらく時間を置いて再度termux-change-repoを実行してください。  
>   
  
#### 3.3.3 また、以下のメッセージが出たら、リターンキーを押してください。  

環境により異なりますが、3度くらい表示されます。  
  
![8](https://github.com/user-attachments/assets/d33da4b0-ad4c-4ba9-969e-fae1c69983e3)  
  
#### 3.3.4 インストールスクリプトの最後にsambaのパスワード入力を求められます。    

userはtermuxです。

```  
sambaのためのパスワードを設定してください
  
New SMB password: *******
Retype new SMB password: ********
Added user termux.  
```  
  
  
#### 3.3.5 インストールスクリプトが完了したら、  

```  
1. exit で termux を終了    
2. 再度 termux を起動  
3. sh svenable.sh を実行  
  
finished    
```  

が表示されます。  
  　
> [!CAUTION]  
> もし、表示されない場合は、正常に終了していません。  
> termuxのミラーサイトがダウンしている場合に発生します。  
> 時間を置いて、3.2の最初からやり直してください。  

#### 3.3.6 次にexitを入力して、termuxを一旦終了してください。  
  
終了しないとサービスの有効化で失敗します。  
  
```  
$ exit   
```  
  
### 3.4 サービス（atd, crond,sshd,lighttpd,smbd）およびwake-lockの有効化  
  
termuxを再起動する。  
  
![6a](https://github.com/user-attachments/assets/0e2c31fa-aa4a-46a3-9019-b2a8b464e45f)
  
svenable.shを実行して、サービス（atd, crond,sshd,lighttpd,smbd）およびwake-lockを有効化します。    
  
```  
$ sh svenable.sh  
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
   
## ５．その他  

### 5.1 sambaアクセス  
    
  
以下の方法で、rfriends3の録音データにアクセスできます。  
  
sambaはポート4455で実行されています。  
IPアドレスを192.168.1.51として記述しています。  
  
#### 1) Linuxの場合  
  
アクセサリー - ファイル - 他の場所  
  
```  
smb://192.168.1.51:4455/smbdir/  
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
  
  
### 5.2 外部PCからのSSHアクセス  
  
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
  
### 5.3 sftpによるファイル転送  
  
　sshによるアクセスができたらPCでsftpによるファイル転送に挑戦してみましょう。  
  
ファイル転送ソフトでsftpに対応しているソフトをインストールしてください。ここでは、FileZillaを使用します。  
  
以下のように設定してください。IP アドレスは4.1で取得したもの、ユーザ名は任意です。  
  
![15](https://github.com/user-attachments/assets/3dd487fb-fccc-46bf-a21d-214d7e1e3148)  
  
成功すると以下のような画面になります。  
  
![16](https://github.com/user-attachments/assets/4a602a09-e98a-4289-942a-21b1c87c93c5)  
  
### 5.4 録音ディレクトリ（内部、microSD）の設定  
  
　初期はスマホのダウンロードディレクトリに設定されています。通常はそのまま変更する必要はありません。  
  
rfriends3の画面で  
  
設定 - 録音フォルダ  
  
を選択し、録音データの格納場所を指定します。  
  
1) スマホのダウンロードディレクトリの場合  
  
```  
usrdir=/data/data/com.termux/files/home/storage/downloads/usr/  
tmpdir = ""  
```  
  
2) 外部microSDの場合  
  
~/storage以下にmedia-1というディレクトリが存在しない場合、  
または、cd ~/storage/media-1 がエラーになる場合は、  
termuxがmicroSDを認識していません。  
termux-setup-storageを再度実行してみてください。  
  
![17](https://github.com/user-attachments/assets/d96a5d4c-e4c5-4696-82ef-24366bf49457)  
  
> [!CAUTION]  
> termux-setup-storage を実行してもSDCARDを認識しない場合は、  
> rm -rf ~/storage を実行後、termux-setup-storage を実行してみてください。  
> SDCARDは初期化されないはずですが、自己責任で。   
  
```  
usrdir = "/data/data/com.termux/files/home/storage/media-1/"  
tmpdir = ""  
```  
  
実際のディレクトリは以下になります。  
  
![18](https://github.com/user-attachments/assets/b7c98e84-fba7-488c-bdd8-2fb53784fb0e)  
  
usrdir: /storage/1D15-8A5B/Android/media/com.termux/  
  
1D15-8A5B部分はそれぞれの環境で異なります。  
  
ファイルマネージャで  
  
/Android/media/com.termux/  
  
にアクセスすればデータが参照できます。  
  
 
  
以上  
  
