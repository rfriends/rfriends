## RaspberryPi版rfriends3でラジオ録音（DietPi編）      
  
RaspberryPiにDietPiとrfriends3をインストールします。  
DietPiとは、徹底的に軽量化・最適化されたDebianベースのLinuxディストリビューションです。  
https://dietpi.com/  
  
2026/05/15現在のバージョンは以下のとおりです。  
  
```  
DietPi v10.3.3 / trixie  
rfriends3 1.4.3b  
```
      
2026/05/16 改定  
  
## 1. 純正のimagerを使用してmicroSDを作成する。     
   <https://www.raspberrypi.com/software/>  

<img width="140" height="144" alt="clip_111" src="https://github.com/user-attachments/assets/89fdd0bc-7ad7-4a5d-9517-cecf5837eb74" />

  
### 1.1 Raspberry Pi デバイス  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W  
  
> [!caution]  
> その際、デバイスを正確に選択してください。  
> 例えば、zero w用はzero 2wでは動作しません。

### 1.2 OS  
インストールするOSを選択する。  
  
Other general-purpose OSからDietPiを選択してください。  
<img width="682" height="482" alt="clip_4" src="https://github.com/user-attachments/assets/c5daceb7-8931-4f91-bae1-7aace0c707ad" />

  
### 1.3 ストレージ  
セットしているmicroSDを選択  
  
### 1.4 microSDにイメージを書き込む  
  <img width="682" height="482" alt="clip_8" src="https://github.com/user-attachments/assets/9bf458fd-aa9d-48ff-b2ca-76577fbe967d" />

  
### 1.5 Wifi設定を行う。  
  
有線を使用するばあいは、この項をスキップしてください。  
  
Windowsの場合はbootドライブを認識していると思います。ここではFドライブ  
<img width="437" height="69" alt="clip_12" src="https://github.com/user-attachments/assets/11c10a0d-1920-4a8d-b9e2-5aa1381c6683" />


  
<img width="654" height="122" alt="clip_11" src="https://github.com/user-attachments/assets/222cbd36-a1d2-40c9-9740-e009de11b62e" />  
  
  
この2つのファイルを編集してください。  
  
1) /boot/firmware/dietpi.txt  
  
```  
AUTO_SETUP_NET_WIFI_ENABLED=1  
```  
  
2) /boot/firmware/dietpi-wifi.txt  
  
```  
aWIFI_SSID[0]='XXXXXXXX'  
aWIFI_KEY[0]='********'  
```  
  
## 2. microSDをraspberrypiにセットし起動する。  
  
初回起動時は領域拡張や初回処理を行うのでmicroSDのサイズによっては時間がかかります。    
また、一度再起動がかかります。  
  
## 3. sshでraspberrypiにアクセスする。  
  
ホスト名 dietpi、ユーザ名 root  
  
```  
ssh root@dietpi  
```  
でアクセスできます。  
  
## 4. 初期設定を行う。  
  
以下の質問が実行されます。  
  
### 1) Please enter a new login password for "root" and "dietpi":  
root,dietpi用のパスワードを入力する。  
  
### 2) Please enter a new default software installation password.
ソフトウエアインストール用のパスワードを入力する。  
  
### 3) A serial/UART console is currently enabled, would you like to disable it?   
serial/UARTコンソールは現在有効ですが、無効にしますか？  
無効にしたい場合はyesを選択してください。  
  
次に、dietpi-softwareが自動起動される。  
  
<img width="600" height="372" alt="clip_13" src="https://github.com/user-attachments/assets/2e4e0f69-6c94-4f53-ab9d-619848c8843a" />
  
### 4) DietPi-config -> Languageを選択し、地域、タイムゾーン等を設定する  
  
```  
5:Language/Regional Options  
Locale : ja,JP-UTF-8  
Timezone : Asia/Tokyo  
Keyboard : jp  
```
    
### 5) Installを選択  
    
追加のソフトウェア選択をしていない場合は、以下のメッセージが出る。  
  
Do you wish to continue with DietPi as a pure minimal image?  
DietPiを最小限の構成で使い続けますか？  
OKを選択してください。  
  
### 6) DietPi-Survey
  
Installが終了すると、DietPi-Surveyの質問がでる。
  
```  
匿名での利用統計情報を収集する。  
  
1：参加してデータをアップロードする  
0：参加せず、アップロードされたデータを削除する  
```
1または0を選択してください。  　
    
これで、Dietpiのインストールが終了。  
  
### 7) 一旦再起動します  
  
```  
# reboot  
```  
  
## 5. セットアップシェルを実行して、rfriends3をインストールする  
  
ユーザdietpiでsshログインする。  
  
```
$ sudo apt-get install git -y  
$ cd ~/  
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh install_debian.sh  
```  
  
結構時間がかかります。  
<img width="600" height="155" alt="clip_5a" src="https://github.com/user-attachments/assets/edd57c62-47f0-48a1-9b45-6de7aa7614f9" />

  
このメッセージが出たらrfriends3のインストール終了です。  
  
## 6. サウンド設定    
  
RaspberryPiにサウンドカードやUSB-DACを接続して、音を出したい場合は以下の処理を追加してください。    
  
```  
$ sudo apt install alsa-utils  
$ sudo usermod -aG audio dietpi  
```  
  
## 7. 再起動  
  
一旦再起動してください。  
  
```  
$ sudo reboot  
```  
  
## 8. Webブラウザを使用してrfriends3にアクセスする。  
  
```  
http://dietpi:8000  
or  
http://xxx.xxx.xxx.xxx:8000  
```  
  
以下のような画面が出たら成功です。  
<img width="389" height="394" alt="rf3-3" src="https://github.com/user-attachments/assets/7bee0e8f-f574-4cfc-906c-19c4e5be2002" />

  
以上  
  

