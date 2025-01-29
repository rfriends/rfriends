余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　WindowsPCをラジオ録音のために24時間稼働させるのはちょっと大変ですよね。そこで、 余ったandroidスマホ/タブレットでrfriendsを動かしてラジオ録音サーバにしようというものです。もちろん余ってないものでもいいのですが普段使いのものとは分けたほうがいいとおもいます。  
  
> [!IMPORTANT]
> インストール時にセキュリティ関連のアラームが表示されますが、基本は許可で進めてください。気になる方はインストールを中止してください。  

初版：2021/01/19  
改版：2025/01/09  
  
## １．準備  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット(OS5.0以上)  
  
androidOS5.0未満では動作しません。  
  
以下のリンクよりインストールスクリプトをスマホのダウンロードディレクトリにダウンロードしてください。  
  
<https://raw.githubusercontent.com/rfriends/rfriends_termux/main/t.zip> 

  
## ２．Termuxのインストール   
  
### 1.1 Termuxのダウンロード  
  
　以下のリンクよりスマホのダウンロードディレクトリにtermuxをダウンロードしてください。  
  
2024/06/21のバージョンは0.119.0-beta.1です。  
  
Github  
  ~~<https://github.com/termux/termux-app/releases>~~
  ~~<https://github.com/termux/termux-app/releases/download/v0.119.0-beta.1/termux-app_v0.119.0-beta.1+apt-android-7-github-debug_universal.apk>~~ 
  
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
  
1) ダウンロードディレクトリにあるt.zipを解凍し実行する。  
ファイル名は入力数を極力抑えるため、t.shにしています。  
  
```
$ cd  
$ termux-setup-storage  
$ cd storage/downloads/  
$ unzip t.zip  
$ sh t.sh  
```
  
2) 途中、以下のメッセージが出たら許可をタップしてください。  
  
  
![5](https://github.com/user-attachments/assets/94836c56-db2b-481f-8601-7c1b53e04273)

  
3) また、以下のメッセージが出たら、リターンキーを押してください。  
  
![6](https://github.com/user-attachments/assets/f56c9f32-668a-4b44-b316-a650ded42b0b)

  
  
4) インストールスクリプトが完了したら、  
  
finished  
  
が表示されます。  
  
次にexitを入力して、termuxを一旦終了してください。  
  
```
$ exit   
```
注）終了しないとサービスの有効化で失敗します。  
  
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
ssh -p 8022 hogehoge@XXX.XXX.XXX.XXX  
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
  
![20241128070819](https://github.com/user-attachments/assets/87314d73-cc63-4d88-94d3-be314d6bdbbb)
![401377018-87314d73-cc63-4d88-94d3-be314d6bdbbb](https://github.com/user-attachments/assets/f0a0c593-3610-443f-afdc-fa46f22f8ab7)

```
usrdir = "/data/data/com.termux/files/home/storage/media-1/"  
tmpdir = ""  
```
  
実際のディレクトリは以下になります。  
  
![20241028065119](https://github.com/user-attachments/assets/d6e7deaf-27f8-4032-b116-dbadf777b231)
![401377041-d6e7deaf-27f8-4032-b116-dbadf777b231](https://github.com/user-attachments/assets/e0bc684a-3241-4f8d-8f34-573f97cc04e0)

usrdir    :     /storage/1D15-8A5B/Android/media/com.termux/  
  
1D15-8A5B部分はそれぞれの環境で異なります。  
  
  
ファイルマネージャで  
  
/Android/media/com.termux/  
  
にアクセスすればデータが参照できます。  
  
  
  
## ７．最後に  
  
　以下はいわゆるお約束の記述です。  
  
・使用は自己責任にてお願いします。当方はいかなる責任も持ちません。 使用を中止したい場合はtermuxをアンインストールしてください。  
  
・このソフトはパケットを消費するため、Wifi環境下での使用をお勧めします。 2時間番組で約40MBになります。外出等で使用をいったん中止する場合は、Termuxをexitしてください。  
  
・劣化したバッテリのスマホを使用すると火災の原因にもなります。  
  
　より良いものにするために、バグ報告・改善提案等をお待ちしています。  
  
では、素敵なラジオライフを！  
  
以上  
