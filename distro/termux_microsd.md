## Termux版rfriends3でmicroSDを使う
  
余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　最近のスマホは、内蔵ストレージが増えている代わりにmicroSDが使えないものが増えています。  
逆に、古いスマホは、microSdが使える代わりに内蔵ストレージが少ない。  
ここでは、古いスマホのmicroSDをrfriends3のデータストレージとして使用する方法を紹介します。  　
  
例として、Amazon fireを取り上げます。おそらく、ほかのスマホでも同様だと思います。  
  
初版：2026/08/11  
改版：2026/08/11  
  
## １．使用したスマホ/タブレット   
  
・Amazon Fire HD 8 (第8世代)  
・Silicon Power microSD 64GB
  
## ２．microSDの初期化

microSDをスマホに挿入する。
設定　ストレージ　外部ストレージとしてフォーマット
  
### ３．microSDの確認 
  
#### 1) microSDのディレクトリの確認
Termux起動します。
microSDが存在する場合、~/storage以下にmedia-1,external-1といったディレクトリがあると思います。  
機種や、termuxのバージョンにより異なる（？)ようです。  
両方存在する場合は、両方試してみてください。  
![17](https://github.com/user-attachments/assets/d96a5d4c-e4c5-4696-82ef-24366bf49457)    

どちらも存在しない場合や、エラーになる場合は、termuxがmicroSDを認識していません。 
以下を実行してください。
```
$ termux-setup-storage
```
~/storage以下にmedia-1,external-1といったディレクトリが見えるようになったと思います。
  
#### 2) usr3ディレクトリの作成  
  
external-1の場合、external-1以下にusr3ディレクトリを作成します。    
```  
$ cd
$ cd storage
$ cd external-1
$ mkdir usr3
```
ファイルマネージャを起動し、Android/data/com.termux/files/usr3 にアクセス出来たら成功です。  
<img width="600" height="210" alt="Screenshot_20260328-214313" src="https://github.com/user-attachments/assets/96155c1d-4ad4-42cd-ab89-102cab6af626" />
  
#### 3) 録音データの格納場所の設定
  
rfriends3の画面で  
  
設定 - 録音フォルダ  
を選択し、録音データの格納場所を指定します。  
```  
usrdir = "/data/data/com.termux/files/home/storage/external-1/usr3/"  
tmpdir = ""  
```  
#### 4) rfriends3のトップ画面が以下のように変わっていたら成功です。  
  
<img width="600" height="214" alt="clip_1" src="https://github.com/user-attachments/assets/79f352a3-1b50-493d-a6b2-9b5ff5870803" />
  
実際のディレクトリは以下になります。  
usrdir: /storage/8CD8-1F72/Android/data/com.termux/files/usr3/  
  
8CD8-1F72部分はそれぞれの環境で異なります。  
  
#### 5) ファイルマネージャで格納場所の再確認
  
ファイルマネージャで    
  
/Android/data/com.termux/files/  
  
にアクセスすればデータが参照できます。  
  
<img width="600" height="210" alt="Screenshot_20260328-214313" src="https://github.com/user-attachments/assets/96155c1d-4ad4-42cd-ab89-102cab6af626" />
  
  
   
  
以上  
  
