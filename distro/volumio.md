## ミュージックプレーヤーVolumio版rfriends3でラジオ録音  
  
　ミュージックプレーヤーvolumio上にrfriendsをインストールするという企画です。  
音楽に加えて、ラジオのライブ放送や録音放送がRaspberryPiで楽しめるようになります。  
  
![1](https://github.com/user-attachments/assets/1a4aceb1-b10b-42f4-b427-0ef64d44f702)  
  
初 版 2024/08/25  
第7版 2025/01/29  
  
## ０．前提  
  
ミュージック・プレーヤーvolumioのインストール手順  
https://rfriends.hatenablog.com/entry/2024/08/24/174527  
  
に従ってRaspberryPiにVolumioをインストールし正常に動作していること。  
また上記手順を参考にしてSSHアクセスができていること。  
  
・RaspberryPiにスピーカ等を接続して音が出る環境ができていること。  
  
下記を参考にしてください。  
  
[RaspberryPiにスピーカを接続する（Volumio,MoOde編）](https://rfriends.hatenablog.com/entry/2024/09/04/175016)    
  
または  
  
[RaspberryPi Zeroをラジオにする](https://rfriends.hatenablog.com/entry/2022/05/01/154913)  
  
## １．システムを最新にする。  
  
　Volumioにsshアクセスします。  
  
![2](https://github.com/user-attachments/assets/6707e2ba-0e96-40b8-bf1d-808a225aca2d)  
  
以下を入力しシステムを最新にします。  
  
```
$ sudo apt-get update && sudo apt-get upgrade -y  
```
  
その際、以下のようなメッセージが表示されることがあります。  
  
```  
Certificate verification failed: The certificate is NOT trusted. The certificate chain uses not yet valid certificate.  
```  
  
その場合は、時間を置いて再度実行してみてください。  
  
```  
$ sudo apt-get update && sudo apt-get upgrade -y  
```
    
それでもダメな場合は、以下を実行してください。  
  
```  
$ sudo mv /etc/apt/sources.list.d /etc/apt/sources.list.d.bak  
$ sudo apt update && sudo apt install -y ca-certificates  
$ sudo mv /etc/apt/sources.list.d.bak /etc/apt/sources.list.d  
$ sudo apt-get upgrade -y  
```  
  
## ２．rfriends3のダウンロードとインストール  
  
updateが終了したら、インストールを行います。各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
$ cd ~/  
$ sudo apt-get install git  
$ rm -rf rfriends_volumio  
$ git clone https://github.com/rfriends/rfriends_volumio.git  
$ cd rfriends_volumio  
$ sh rfriends_volumio.sh  
```
  
これでインストールは完了です。  
  
## ３．rfriends3の実行  
  
volumioのWeb画面で  
  
ハンバーガーアイコン - システム設定 - プレーヤー名  
  
volumio  
  
だった場合、ウェブブラウザ（edge,chrome,firefox,...）を起動し、以下を入力してください。  
  
```
rfriends3  :   
http://volumio.local:8000  
volumio :   
http://volumio.local  
```  
  
以下のような画面が出たら成功です。ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
「ヘルプ」「システム更新」でシステムを最新にしてください。  
  
![3](https://github.com/user-attachments/assets/feaaa8c4-09c7-4222-8b1a-a23959986f5d)  
  
## ４．動作確認 (ラジコを聴く)  
  
まず、Volumio側で音量を絞ってください。トップ画面の右下のスピーカーアイコンをタップするとボリューム調整画面が表示されます。  
  
![4](https://github.com/user-attachments/assets/63e4b592-ccc9-4431-8c40-36f26540c4ed)  
  
![5](https://github.com/user-attachments/assets/2946a211-6ea4-40b9-ae66-4392d0ea8ecb)  
  
rfriendsのメニューで、ラジコ - 番組聴取 - 番組を選択し  
  
聴取（サーバ）を選択すると音がスピーカから再生されます。  
  
音量調整はVolumio側で行ってください。  
  
![6](https://github.com/user-attachments/assets/b674bc07-4f10-418e-bb80-f324f655a3ce)  
  
## ５．その他  
    
これにより、ラジコやらじるらじる、音楽が良い音で楽しめるようになります。    
    
    
以上    
    
