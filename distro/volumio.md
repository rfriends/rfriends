## ミュージックプレーヤーVolumio版rfriends3でラジオ録音(改)  
  
　raspberry piのミュージックプレーヤーvolumio上にrfriendsをインストールするという企画です。  
音楽に加えて、ラジオのライブ放送や録音放送がRaspberryPiで楽しめるようになります。  
https://volumio.com/  
  
以前のドキュメントは古くなったので全面的に書き換えました。(2020/05/08)  
  
<img width="600" height="300" alt="47233834-5352-4b09-9308-f88842119cb5" src="https://github.com/user-attachments/assets/d62bfc88-a841-4fb4-a8b3-3ebdd3e542f2" />
  
  
初 版 2026/05/08  
第2版 2026/05/09  
  
  
## ０．前提  
  
volumio のインストールに関しては、  
以下で検索すれば、詳しいサイトが見つかるので  
そこを参考にインストールしてください。  
  
```  
raspberry pi volumio インストール  
```  
  
ここでは、以下のことを前提にしています。  
  
・Volumioが正常に動作し、Webアクセス出来ていること。  
・スピーカ等を接続して音が出る環境ができていること。  
・SSHアクセスができていること。  
  
当方は以下の環境で確認しました。  
・Raspberry Pi 3B / zero 2  
・volumio Ver. 4.119 2026/03/24  
・rfriends3 1.4.3a  
・USB-DAC CX31993 384khz HIFI AUDIO  
  
volumioは現状32bit版なので、RaspberryPiはたぶんどの機種でも大丈夫だと思います。  
ただし、メモリ512KBではちょっと苦しいかもしれません。  
  
  
## １．システムを最新にする。  
  
　Volumioにsshアクセスします。  
  
<img width="600" height="372" alt="clip_4" src="https://github.com/user-attachments/assets/42b2c137-b959-4627-80c5-e20e324c2ddd" />  
  
    
以下を入力しシステムを最新にし、gitをインストールします。  
  
```  
$ sudo apt-get update && sudo apt-get upgrade -y  
$ sudo apt-get install git  
```  
  
  
## ２．rfriends3のダウンロードとインストール  
  
各種ツールをインストールし、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
$ cd ~/  
$ rm -rf rfriends_volumio  
$ git clone https://github.com/rfriends/rfriends_volumio.git  
$ cd rfriends_volumio  
$ sh rfriends_volumio.sh  
```  
<img width="600" height="155" alt="clip_5" src="https://github.com/user-attachments/assets/f80b12eb-bc39-459d-9234-145d601ff581" />

  
これでインストールは完了です。  
念のため、システムを再起動してください。  
  
  
## ３．rfriends3の実行  
  
volumioにWebアクセス出来ているはずなので  
    
```  
volumio :  
http://(IPアドレス)
  
volumio-Dev :  
http://(IPアドレス)/dev  
```
  
ウェブブラウザ（edge,chrome,firefox,...）を起動し、以下を入力してください。  
  
```    
rfriends3  :  
http://(IPアドレス):8000  
```  
  
以下のような画面が出たら成功です。  
ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
ヘルプ - システム更新でシステムを最新にしてください。  
  
<img width="506" height="462" alt="clip_6" src="https://github.com/user-attachments/assets/4f498e21-d2ec-47c9-9611-c445b759d4ee" />

  
  
## ４．動作確認 (ラジコを聴く)  
  
### 4.1 まずrfriends3のalsa設定を行ってください。  
  
管理 - OS別機能 - Linux - audio選択(ALSA)  
<img width="290" height="179" alt="clip_7" src="https://github.com/user-attachments/assets/4a1a758d-83bf-4b50-b656-89901ecdb1af" />
  
Card.Mixerを選択してください。  
<img width="259" height="284" alt="clip_8" src="https://github.com/user-attachments/assets/e457bbc4-e446-480f-bef6-863082196acd" />
  
  
### 4.2 次に、rfriends3でradikoを聞いてみます。  
  
Volumio側で音量を絞ってください。  
トップ画面の右下のスピーカーアイコンをタップするとボリューム調整画面が表示されます。  
  
![4](https://github.com/user-attachments/assets/63e4b592-ccc9-4431-8c40-36f26540c4ed)  
  
![5](https://github.com/user-attachments/assets/2946a211-6ea4-40b9-ae66-4392d0ea8ecb)  
  
rfriendsのメニューで、ラジコ - 放送中 - 番組を選択し  
聴取（サーバ）を選択すると音がスピーカから再生されます。  
  
  
音量調整はrfriends3/Volumio側で行えます。  
  
![6](https://github.com/user-attachments/assets/b674bc07-4f10-418e-bb80-f324f655a3ce)  
  
    
## ５．volumioでjacketを表示する方法
  
volumioでは埋め込みジャケットに対応していないため、画面が少しさみしくなります。  
rfriends3では、ファイル転送時に、folder.jpgを作成してjacket表示をさせることができます。  
  
rfriedns3の「設定 - パラメータ - 編集」 (760行あたり)  
  
rftrans_jacket=2  
に設定すると、番組データ転送時にjacket(folder.jpg)を作成作成します。  
また、cleanjob実行時に不足しているjacket(folder.jpg)を作成します。  
  
```
設定例）
録音時に、timefree、聞き逃し、podcastデータを/data/INTERNAL/data/に転送し
jacketを作成する。

;; 0:off,1:iTunes,2:ディレクトリ指定,3:Gdrive 
rftrans = 2
;; rftrans＝2 の時、0:局別番組別、1:番組別、2:局別、3:分別無
rftrans_s = 0
;; 0:off,1:folder.jpg 転送,2:folder.jpg 転送及び作成
rftrans_jacket = 2
;; ディレクトリ
rftrans_dir = "/data/INTERNAL/data/"
;; Gdriveのみ
;; 0:なし、1-14:制限値以上になると古いものから削除
rftrans_limit = 0
;; ----------------------------
;; radiko　 (2:move 1:copy 0:off)
rftrans_radiko = 0
;; radiru　 (2:move 1:copy 0:off)
rftrans_radiru = 0
;; timefree (2:move 1:copy 0:off)
rftrans_timefree = 2
;; radiru_vod (2:move 1:copy 0:off)
rftrans_radiru_vod = 2
;; radiru_gogaku (2:move 1:copy 0:off)
rftrans_radiru_gogaku = 0
;; podcast (2:move 1:copy 0:off)
rftrans_podcast = 2
```
<img width="601" height="541" alt="clip_11" src="https://github.com/user-attachments/assets/3f3b2648-4fd8-4368-a5a2-6d0ba98c21bd" />
 

## ６．その他  
  
### 6.1 NHK らじるらじるを聞く  
  
radikoと同様にrfriendsでNHKらじるらじるも聞けますが、  
以下の設定でVolumio単体でも聞けるようになります。  
注）2026/03末でR2 は閉局しました。  
  
```  
$ cd ~  
$ wget http://rfriends.s1009.xrea.com/storage/my-web-radio  
$ sudo cp -p my-web-radio /data/favourites/.  
```  
  
マイウェブラジオからアクセスしてください。  
![clip_2](https://github.com/user-attachments/assets/edd83de7-7eb7-4d27-aa72-8c19a8d8fddd)  

### 6.2 sambaアクセスについて  

Windows11 homeユーザでsambaアクセスができない場合、 
sshでログインし、  
  
```
$ sudo smbpasswd -a volumio
$ sudo systemctl restart smbd
```  
を実行したのち、ブラウザで  
\\(IPアドレス)  
を入力してください。  
  
   
以上  
  
    
