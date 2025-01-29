## ミュージックプレーヤーMoOde上にrfriendsをインストールする。  
  
ミュージックプレーヤーMoOde上にrfriendsをインストールするという企画です。  
音楽に加えて、ラジオのライブ放送や録音放送がRaspberryPiで楽しめるようになります。  
  
![1](https://github.com/user-attachments/assets/1cd6790e-c995-4e30-95cf-2f58c0e8cb26)  
  
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
  
![2](https://github.com/user-attachments/assets/fc4e21a3-3a14-4b27-885b-0484cf9e3b4a)  
  
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
  
![3](https://github.com/user-attachments/assets/f2b0756d-0ae5-4ad0-b1d1-b781bb6ce700)  
  
## ３．動作確認 (ラジコを聴く)  
  
まず、MoOde側で音量を絞ってください。トップ画面の右下のスピーカーアイコンをタップするとボリューム調整画面が表示されます。  
  
![4](https://github.com/user-attachments/assets/702aa07f-4018-4ac9-8ddc-dd002acf6ce6)  
  
円周か、＋－をクリックすることで音量を調整できます。  
  
![5](https://github.com/user-attachments/assets/b243c3f5-e323-4e93-aa18-1586c8c82adb)  
  
rfriendsのメニューで、ラジコ - 番組聴取 - 番組を選択し  
  
聴取（サーバ）を選択すると音がスピーカから再生されます。  
  
音量調整はMoOde側で行ってください。  
  
![6](https://github.com/user-attachments/assets/bf56b214-1e6c-4b4d-886d-10f4f2e829fc)  
  
## ４．ライブラリの更新  
ラジコやらじるらじるの番組を録音しても、そのままではライブラリに登録されません。  
  
m - Configure - Library - HomeIcon を選択します。  
 
![7](https://github.com/user-attachments/assets/af7cd6a4-e283-4445-bc61-8897a01578f3)  
  
m - Update Library を選択するとライブラリに登録されます。  
  
その後、「SDCARD」を選択すると、録音した番組が表示され再生できるようになります。  
  
![8](https://github.com/user-attachments/assets/4dfa219f-9717-4092-a752-a381aa5b87ff)  
  
Library - Album を選択すると一覧が表示されます。  
  
![9](https://github.com/user-attachments/assets/4ae0689a-678e-4496-b8cb-48440d607457)  
  
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

