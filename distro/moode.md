## ミュージックプレーヤーMoOde上にrfriendsをインストールする。  
  
ミュージックプレーヤーMoOde上にrfriendsをインストールするという企画です。  
音楽に加えて、ラジオのライブ放送や録音放送がRaspberryPiで楽しめるようになります。  
![20240831124701](https://github.com/user-attachments/assets/994f6391-c68a-4494-af52-16559445f1e5)
  
初 版　2024/08/31  
第6版　2025/01/09  
  
## ０．前提  
  
・ミュージック・プレーヤーMoOdeのインストール手順  
https://rfriends.hatenablog.com/entry/2024/08/31/035134  
に従ってRaspberryPiにMoOdeをインストールし正常に動作していること。  
またSSHアクセスができていること。  
  
・RaspberryPiにスピーカ等を接続して音が出る環境ができていること。  
  
下記を参考にしてください。  
  
RaspberryPiにスピーカを接続する（Volumio,MoOde編）  
https://rfriends.hatenablog.com/entry/2024/09/04/175016  
または  
RaspberryPi Zeroをラジオにする  
https://rfriends.hatenablog.com/entry/2022/05/01/154913  
  
## １．rfriends3のダウンロードとインストール  
  
　MoOdeにsshアクセスします。  
  
![20240831125458](https://github.com/user-attachments/assets/6ee4ca1c-b2cf-4a61-a862-65925e295499)

以下を入力し、インストールスクリプトをダウンロードし、インストールを行います。各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
```  
cd ~/  
sudo apt install git  
rm -rf rfriends_moode  
git clone https://github.com/rfriends/rfriends_moode.git  
cd rfriends_moode  
sh rfriends_moode.sh  
```  
  
これでインストールは完了です。リターンキーを押すと再起動します。  
  
## ２．rfriends3の実行  
  
microSD作成時に設定したホスト名（ここではmoode）により、  
  
ウェブブラウザ（edge,chrome,firefox,...）を起動し、以下を入力してください。  
```  
rfriends3  :   
http://moode.local:8000  
MoOde :   
http://moode.local  
```  
以下のような画面が出たら成功です。ブラウザはローカル(現在実行中のPC)でもリモート（同一ネットワーク上のPC,MAC,スマホ等）でもOKです。  
  
「ヘルプ」「システム更新」でシステムを最新にしてください。  
![20240831130519](https://github.com/user-attachments/assets/c185bc3f-d382-47cb-baea-825b3b7ceee2)
  
## ３．動作確認 (ラジコを聴く)  
  
まず、MoOde側で音量を絞ってください。トップ画面の右下のスピーカーアイコンをタップするとボリューム調整画面が表示されます。  
![20240901085815](https://github.com/user-attachments/assets/97c73bbb-1949-458a-bcf1-27c3c641727e)
 
  
  
円周か、＋－をクリックすることで音量を調整できます。  
![20240901085841](https://github.com/user-attachments/assets/4445a36f-4300-4d67-af94-10bb0d2fae93)
  
rfriendsのメニューで、ラジコ - 番組聴取 - 番組を選択し  
  
聴取（サーバ）を選択すると音がスピーカから再生されます。  
  
音量調整はMoOde側で行ってください。  
 
![20240901090217](https://github.com/user-attachments/assets/4a7338e3-a05b-4595-bbad-b81fc6ae8071)
 
  
## ４．ライブラリの更新  
ラジコやらじるらじるの番組を録音しても、そのままではライブラリに登録されません。  
  
m - Configure - Library - HomeIcon を選択します。  
 
![20240902083648](https://github.com/user-attachments/assets/5dec454c-0e6b-47ac-a4ae-ce9682e40340)
 
m - Update Library を選択するとライブラリに登録されます。  
  
その後、「SDCARD」を選択すると、録音した番組が表示され再生できるようになります。  
 
![20240902091743](https://github.com/user-attachments/assets/92e225e9-9be7-4437-97f2-f9bdc962a2c0)
 
Library - Album を選択すると一覧が表示されます。  
![20240903062807](https://github.com/user-attachments/assets/86a930dd-2097-4ad9-96bd-ecf13453a5f2)
  
## ５．その他  
  
1) samba  
m - Configure - System - File sharing  
SMB(Samba) ON  
```    
\\moode.local でアクセスできます。  
```  
  
2) Web SSH  
m - Configure - System - Security   
Web SSH ON  
  
その下の「OPEN」をクリックすると、ブラウザ上でSSHができます。  
  
若干の制限あり。  
  
   
  
  
以上  

