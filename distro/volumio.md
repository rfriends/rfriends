ミュージックプレーヤーVolumio上にrfriendsをインストールする。  
  
　ミュージックプレーヤーvolumio上にrfriendsをインストールするという企画です。  
音楽に加えて、ラジオのライブ放送や録音放送がRaspberryPiで楽しめるようになります。  
 
![20240829032049](https://github.com/user-attachments/assets/a1444fbb-d046-4f02-b1f3-7acafa9eed58)
  
初 版 2024/08/25  
第7版 2025/01/09  
  
## ０．前提  
  
ミュージック・プレーヤーvolumioのインストール手順  
https://rfriends.hatenablog.com/entry/2024/08/24/174527  
  
に従ってRaspberryPiにVolumioをインストールし正常に動作していること。  
また上記手順を参考にしてSSHアクセスができていること。  
  
・RaspberryPiにスピーカ等を接続して音が出る環境ができていること。  
  
下記を参考にしてください。  
  
RaspberryPiにスピーカを接続する（Volumio,MoOde編）  
https://rfriends.hatenablog.com/entry/2024/09/04/175016  
または  
  
RaspberryPi Zeroをラジオにする  
https://rfriends.hatenablog.com/entry/2022/05/01/154913  
  
## １．システムを最新にする。  
  
　Volumioにsshアクセスします。  
 
![20240825110256](https://github.com/user-attachments/assets/626a97c2-cd27-426c-ab71-99d1bec32cb0)

 
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
  
![20240828133221](https://github.com/user-attachments/assets/e53ae714-12c8-4333-85f7-60f304b35075)

## ４．動作確認 (ラジコを聴く)  
  
まず、Volumio側で音量を絞ってください。トップ画面の右下のスピーカーアイコンをタップするとボリューム調整画面が表示されます。  
  
![20240825130906](https://github.com/user-attachments/assets/68322ffa-8377-4e56-98e6-86ef0d9d208c)  
  
![20240825130658](https://github.com/user-attachments/assets/35ce4897-0036-45c0-a2a8-317b1156e387)

rfriendsのメニューで、ラジコ - 番組聴取 - 番組を選択し  
  
聴取（サーバ）を選択すると音がスピーカから再生されます。  
  
音量調整はVolumio側で行ってください。  
  
![20240825130532](https://github.com/user-attachments/assets/8f323b65-e6f9-43ad-8e51-7dabf4a16549)

## ５．その他  
    
これにより、ラジコやらじるらじる、音楽が良い音で楽しめるようになります。    
    
    
以上    
    
