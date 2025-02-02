## Termux版rfriends3でラジオ録音  
  
余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　WindowsPCをラジオ録音のために24時間稼働させるのはちょっと大変ですよね。そこで、 余ったandroidスマホ/タブレットでrfriendsを動かしてラジオ録音サーバにしようというものです。もちろん余ってないものでもいいのですが普段使いのものとは分けたほうがいいとおもいます。  
  
> [!IMPORTANT]  
> インストール時にセキュリティ関連のアラームが表示されますが、基本は許可で進めてください。気になる方はインストールを中止してください。  
  
初版：2021/01/19  
改版：2025/02/02
  
## １．準備  
  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット(OS5.0以上)  
  
androidOS5.0未満では動作しません。  
  
以下のリンクよりインストールスクリプトをスマホのダウンロードディレクトリにダウンロードしてください。  
  
<a href=https://raw.githubusercontent.com/rfriends/rfriends_termux/main/termux.sh download>termux.sh</a>   
  
## ２．Termuxのインストール   
  
Termuxは、AndroidやChrome OS上でLinux環境を実行できるターミナルエミュレータアプリです。  
    
### 1.1 Termuxのダウンロード  
  
　以下のリンクよりスマホのダウンロードディレクトリにtermuxをダウンロードしてください。  
  
2024/06/21のバージョンは0.119.0-beta.1です。  
  
Github  
~~<https://github.com/termux/termux-app/releases>~~  
~~<a href=https://github.com/termux/termux-app/releases/download/v0.119.0-beta.1/termux-app_v0.119.0-beta.1+apt-android-7-github-debug_universal.apk download>termux.apk</a>~~  
    
F-droid  
  
<https://f-droid.org/ja/packages/com.termux/>  
  
<https://f-droid.org/repo/com.termux_1020.apk>  
  
### 1.2 Termuxのインストール  
  
　ファイルマネージャを起動し、ダウンロードディレクトリにあるcom.termux_1020.apkをタップしてtermuxをインストールしてください。  
  
![1](https://github.com/user-attachments/assets/ec21a6a9-5f93-4994-9b3d-4bfa6caeed05)  
  
上記のような画面が出たら、"詳細"を押して下さい。（androidのバージョンにより画面は異なります）  
  
![2](https://github.com/user-attachments/assets/c73aa8f6-a572-4e39-aa9b-091d87f4f2f2)  
  
さらに、"インストールする"を押してtermuxのインストールを行ってください。  
  
以上でtermuxのインストールは完了です。  
  
## ３．rfriends3のインストール  
  
### 3.1 Termuxの起動  
  
Termuxを起動してください。  
  
![3](https://github.com/user-attachments/assets/5b603b6c-b936-4f29-9ee4-c2445ece319a)  
  
  
これ以降は、Termux内での操作となります。  
  
![4](https://github.com/user-attachments/assets/606a3c45-1e29-424e-ba3b-a0adb83eb88b)  
  
### 3.2 ツールおよびrfriends3をインストールする  
  
1) termuxのミラーサイトを変更する。   
  
```  
$ termux-change-repo  
```
  
ミラーをグループにするかシングルにするかの選択画面が出ますが、そのままOKを選択してください。  
  
![1](https://github.com/user-attachments/assets/0aa57fc5-5eef-41da-9869-67d0385a7630)  
  
ミラーグループの選択画面が出ますが、そのままOKを選択してください。   
  
![2](https://github.com/user-attachments/assets/89086643-38d8-4cba-9245-ab138f19831d)  
  
> [!CAUTION]  
> ミラーサイトのチェックが行われますが  
> Error: None of mirrors are accessable  
> のようなメッセージが出た場合はミラーサイトがすべてダウンしているので、  
> しばらく時間を置いて再度termux-change-repoを実行してください。  
>   
  
2) ダウンロードディレクトリにあるtermux.shを実行する。    
  
```
$ cd  
$ termux-setup-storage
$ cd storage/downloads/
$ ls  
$ sh termux.sh  
```  
  
3) 途中、以下のメッセージが出たら許可をタップしてください。  
  
![5](https://github.com/user-attachments/assets/94836c56-db2b-481f-8601-7c1b53e04273)  
  
  
4) また、以下のメッセージが出たら、リターンキーを押してください。  
  
![6](https://github.com/user-attachments/assets/f56c9f32-668a-4b44-b316-a650ded42b0b)  
  
5) インストールスクリプトが完了したら、  

```  
1. exit で termux を終了    
2. 再度 termux を起動  
3. sh svenable.sh を実行  
  
finished    
```  
  
が表示されます。  

次にexitを入力して、termuxを一旦終了してください。  
終了しないとサービスの有効化で失敗します。  
  
```  
$ exit   
```  
  
> [!CAUTION]  
> もし、表示されない場合は、正常に終了していません。  
> termuxのミラーサイトがダウンしている場合に発生します。  
> 時間を置いて、3.2の最初からやり直してください。  
  
### 3.3 サービス（atd, crond,sshd,lighttpd）およびwake-lockの有効化  
  
termuxを再度実行後、termux-sevicesを使用してサービス（atd, crond,sshd,lighttpd）およびwake-lockを有効化する。  
  
```  
$ cd  
$ sh svenable.sh  
```  
  
![7](https://github.com/user-attachments/assets/47eb656e-106f-4e24-856d-1c4d7cdf88a5)  
  
上記のような画面が出たら、"許可"(または"はい")を押してください。これにより予約録音ができるようになります。  
  
また、ロック画面に以下のようなメッセージが表示されます。  
  
![8](https://github.com/user-attachments/assets/f727e1ff-5317-4ef5-8b3b-d7502269b639)  
  
wake-lockの有効化を行わないと、スマホがスリープしたときにTermuxも停止してしまい録音が中断されます。ただし、有効化した場合は、ACアダプタに接続しての運用を行ってください。スマホを再起動したときは再度確認が必要です。  
  
スクリプトが完了したら、  
  
ブラウザで、http://xxx.xxx.xxx.xxx:8000 にアクセスしてください。  
  
が表示されます。上記アドレスをメモしてください。  
  
以上でrfriends3のインストールは完了です。Webサーバ（lighttpd）はすでに起動しています。  
  
## ４．rfriends3の設定  
  
### 4.1 rfriends3のWebサーバへのアクセス  
  
　androidスマホ自身または同一LAN に接続されたPC等からWEBブラウザ（chrome,edge,firefox等）で上記でメモした  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
  
![9](https://github.com/user-attachments/assets/6b755320-95ff-43a9-a2e2-7d5d3daac64c)  
  
### 4.2 rfriends3を最新にアップデート  
  
ヘルプ - システム更新(SYS)  
  
により、rfriends3を開発版（1.1.2-a03以上）にupdateする。  
  
![10](https://github.com/user-attachments/assets/ad195d2f-5852-4200-85bb-533ea1ec1805)  
  
以降、バージョンによりメニュー番号が異なっている可能性があります。  
  
### 4.3 デイリー処理の設定  
  
設定 - 定期実行 - 登録  
  
を選択し、crontab登録をクリックします。これにより、指定した時刻に予約・録音ができるようになります。  
  
![11](https://github.com/user-attachments/assets/9aa2d0b4-6ea7-4061-ad58-74f7beeb7e2e)  
  
## ５．確認テスト  
  
Timefree - 録音・聴取  
  
で、１，２個試しに録音してみてください。  
  
![12](https://github.com/user-attachments/assets/c87f48b5-1a5d-4e70-8c24-e7dcd2b60506)  
  
　録音が終了したら、androidのファイルマネージャでダウンロードディレクトリ/usrを参照してください。  
  
![13](https://github.com/user-attachments/assets/e336afae-c1d1-4e3c-800a-4b3ab489650f)  
   
　録音したファイルがtimefree以下に見つかるとおもいます。  
  
![14](https://github.com/user-attachments/assets/867547ce-6915-406c-b2f8-30f90adf16ed)  
  
　以上で、インストールの確認は終了です。  
  
## ６．その他  
  
### 6.1 外部PCからのSSHアクセス  
  
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
  
### 6.2 sftpによるファイル転送  
  
　sshによるアクセスができたらPCでsftpによるファイル転送に挑戦してみましょう。  
  
ファイル転送ソフトでsftpに対応しているソフトをインストールしてください。ここでは、FileZillaを使用します。  
  
以下のように設定してください。IP アドレスは4.1で取得したもの、ユーザ名は任意です。  
  
![15](https://github.com/user-attachments/assets/3dd487fb-fccc-46bf-a21d-214d7e1e3148)  
  
成功すると以下のような画面になります。  
  
![16](https://github.com/user-attachments/assets/4a602a09-e98a-4289-942a-21b1c87c93c5)  
  
### 6.3 録音ディレクトリ（内部、microSD）の設定  
  
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
  
~/storage以下にmedia-1というディレクトリが存在しない場合は、termuxがmicroSDを認識していません。termux-setup-storageを再度実行してみてください。  
  
![17](https://github.com/user-attachments/assets/d96a5d4c-e4c5-4696-82ef-24366bf49457)  
  
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
  
