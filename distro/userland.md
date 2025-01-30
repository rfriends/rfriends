## Android UserLAnd版rfriends3でラジオ録音  
  
androidのUserLAnd版です。非常に簡単ですのでぜひ’試してみてください。  
  
  
初 版　2023/07/14  
第7版　2025/01/16　github  
  
## １．環境  
userland,ubuntu22.04で動作確認しました。  
  
制限事項  
   
・atdが動作していないので、ラジコ、らじるらじるの予約録音ができません。   
・cronは動作するので、毎日決まった時間にタイムフリー、聞き逃しを実行するというようなことは可能です。  
  
## ２．UserLAndのインストール  
　google playよりUserLAndをインストール  
  
![1](https://github.com/user-attachments/assets/1b2e9afc-b8b5-4135-bbde-529e00b513c2)  
  
　Ubuntuを選択  
  
![2](https://github.com/user-attachments/assets/4fd8776a-f14b-4027-a40f-34b2bed22a76)  
  
Ubuntu、permissionOK、メディアアクセス許可、Minimal、Terminalの選択でセットアップが始まります。インストールが完了すると、以下のようなメッセージが出ます。  
  
![3](https://github.com/user-attachments/assets/7106d186-f3b0-45f5-89cf-456c624e8cfc)  
  
## ３．rfriends3のインストール  
rfriends3,lighttpdのインストールを行います。  
  
```
$ cd ~/  
$ pkg install git -y  
$ rm -rf rfriends_userland  
$ git clone https://github.com/rfriends/rfriends_userland.git  
$ cd rfriends_userland  
$ sh rfriends_userland.sh   
  
IP address : XXX.XXX.XXX.XXX  
```  
　これでrfriends3のインストールは完了です。実行の最後にIP addressが表示されます。  
  
## ４．rfriends3の実行  
　androidのホーム画面に戻り（終了はしない）、ウェブブラウザ（edge,chrome,firefox,...）を起動し、アドレスに先ほど表示されたIP address:8000を入力する。  
  
xxx.xxx.xxx.xxx:8000  
  
以下のような画面が出たら成功です。お気に入りに入れておくと便利です。  
  
![4](https://github.com/user-attachments/assets/cd404fa0-eb7b-495c-bfaa-5aa604214252)  
  
同一Wifi-lanに接続された他端末からもアクセス可能です。  
  
まずは、以下のチュートリアルで操作に慣れてください。
[チュートリアル](https://github.com/rfriends/rfriends3/wiki/%EF%BC%90%EF%BC%90%EF%BC%8E%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
   
## ５．androidからのアクセス  
　UserLAndをインストールしたandroidで、ファイルマネージャ（Filesやファイルマネージャ＋など）を使って  
  
/Android/data/tech.ula/files/storage  
  
にアクセスすると、rfriends3のusr2以下が見えます。ここに録音したデータが保存されています。  
  
![5](https://github.com/user-attachments/assets/2c2e9f20-09e7-41ad-acdf-997d8f3daaad)  
  
## ６．wakelock  
androidのスリープ時にもrfriends3の処理を継続したい場合、WakeLockを有効にしてください。ロック画面でacquire wakelockを押してください。以下のような画面になると思います。  
  
![6](https://github.com/user-attachments/assets/9b9da13a-6254-4c0b-a089-3622d760027b)  
  
この設定をおこなうと、例えば毎朝05:25にtimefreeの実行等を行うことができますが、andoridの電池の消費量が増えます。手動ダウンロードのみで運用する場合は、設定の必要はありません。  
  
## ７．その他  
現状、ラジコ、らじるらじるのリアルタイム予約録音はできませんが、そのほかのtimefree、らじる聞き逃しの予約録音、手動録音やポッドキャストは可能ですので  
  
十分使えると思います。  
  
   
  
以上  
  

