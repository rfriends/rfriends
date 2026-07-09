# Raspberry Pi Imagerを使用してカスタムイメージをmicroSDに書く  
  
rfriends3では各種イメージをという形式で提供しています。  
そのイメージをmicroSDに書く方法について説明します。  
  
## １．rfriends3のシステムイメージをダウンロードする。   
    
それぞれの説明ページに従ってイメージをダウンロードしてください。  
  
リンクを右クリックして「名前をつけてリンク先を保存する」。    
XXXXX.img.gzファイルが保存されますが、解凍の必要はありません。  
 
  
## ２．イメージをmicroSDに書く。(Windows,Linux,macOS)
  
### １）microSDカード用ツールのインストール  
  
システムイメージをmicroSDカードに書き込むツール（Raspberry Pi Imager）をインストールします。  
以下のリンク先よりRaspberry Pi Imager(Windows,Linux,macOS)をダウンロード、インストールてください。  
  
　[Raspberry Pi Imager](https://www.raspberrypi.com/software/)　
   
<img width="561" height="469" alt="raspi" src="https://github.com/user-attachments/assets/6db56bc1-0109-48c9-90c1-06f3f87bbdc9" />

### ２） Raspberry Pi Imagerを使ってイメージをmicroSDに書く。  
  
Raspberry Pi Imagerを実行してください。  
イメージをmicroSDに書く処理の流れは以下のとおり。  
Raspberry Pi Imagerの機種、バージョンの違いによりメッセージ等が異なります。  
    
### 1) Device  
使用するRaspberryPiの機種  
<img width="682" height="482" alt="raspi2" src="https://github.com/user-attachments/assets/1dd65eb0-20e8-425a-8752-c5279d7f31d7" />  
  
  
### 2) OS  
カスタムイメージを使う/Use Custom  
先ほどダウンロードしたxxxxx.img.gzを指定してしてください。  
<img width="682" height="482" alt="raspi3" src="https://github.com/user-attachments/assets/57c967fa-09b3-40e7-bc1c-55b2495b6f4c" />  
  
  
### 3) ストレージ  
microSDを選択（間違えないように！）  
<img width="682" height="482" alt="raspi5" src="https://github.com/user-attachments/assets/a585172c-a1cf-484f-a783-205f583abe8a" />    
  
  
### 4) Customisation  
バージョンによりこの項目は表示されずにスキップされる。  
表示された場合も、「いいえ」を選択する。  
<img width="550" height="202" alt="raspi55" src="https://github.com/user-attachments/assets/51e7e853-c08c-4188-8227-d9d8473c8ef2" />
  
  
### 5) Writing  
実際にmicroSDに書き込みを行う。  
<img width="682" height="482" alt="raspi6" src="https://github.com/user-attachments/assets/e5415330-be28-4e16-a397-dc8435b0ac6a" />  
  
  
### 6) Done  
終了。   
    
## ３．その他  
  
以上で終了です。  
microSDを取り出し使用してください。  
  
以上
  
