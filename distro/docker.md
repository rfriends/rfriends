## rfriends3のインストール手順 (UserLAnd編)  
  
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
  
![20230714171458](https://github.com/user-attachments/assets/24a3bb0e-540b-4fbf-bb7b-b32bf331dd13)

　Ubuntuを選択  
  
![20230714171547](https://github.com/user-attachments/assets/c790cdba-099e-4858-b4c3-df03e0815421)
  
Ubuntu、permissionOK、メディアアクセス許可、Minimal、Terminalの選択でセットアップが始まります。インストールが完了すると、以下のようなメッセージが出ます。  
  
![20230714171801](https://github.com/user-attachments/assets/48372460-28ff-437c-af5f-9410279126cb)

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
  
![20240227025019](https://github.com/user-attachments/assets/8967278c-360c-4d3f-845f-c6f7e105f324)
  
同一Wifi-lanに接続された他端末からもアクセス可能です。  
  
まずは、以下のチュートリアルで操作に慣れてください。
[チュートリアル](https://github.com/rfriends/rfriends3/wiki/%EF%BC%90%EF%BC%90%EF%BC%8E%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
   
## ５．androidからのアクセス  
　UserLAndをインストールしたandroidで、ファイルマネージャ（Filesやファイルマネージャ＋など）を使って  
  
/Android/data/tech.ula/files/storage  
  
にアクセスすると、rfriends3のusr2以下が見えます。ここに録音したデータが保存されています。  
  
  
![20240227031348](https://github.com/user-attachments/assets/3405d8fe-dbfb-4e20-88ec-10a4338e5e31)

  
## ６．wakelock  
androidのスリープ時にもrfriends3の処理を継続したい場合、WakeLockを有効にしてください。ロック画面でacquire wakelockを押してください。以下のような画面になると思います。  
  
  
![20240227024006](https://github.com/user-attachments/assets/adc5b031-42c4-4694-bb97-b6271b115a9f)

  
この設定をおこなうと、例えば毎朝05:25にtimefreeの実行等を行うことができますが、andoridの電池の消費量が増えます。手動ダウンロードのみで運用する場合は、設定の必要はありません。  
  
## ７．その他  
現状、ラジコ、らじるらじるのリアルタイム予約録音はできませんが、そのほかのtimefree、らじる聞き逃しの予約録音、手動録音やポッドキャストは可能ですので  
  
十分使えると思います。  
  
   
  
以上  
  

