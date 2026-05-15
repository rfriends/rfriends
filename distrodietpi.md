2026/05/15  
## RaspberryPi版rfriends3でラジオ録音（DietPi編）      
  
RaspberryPiにDietPiとrfriends3をインストールする。  
  
2026/05/15現在のバージョンは以下のとおりです。  
  
DietPi v10.3.3 / trixie  
rfroends3 1.4.3b  
    
2026/05/15 改定  
  
## 1. 純正のimagerを使用してmicroSDを作成する。     
   <https://www.raspberrypi.com/software/>  
  
![1](https://github.com/user-attachments/assets/de69af3e-f501-40e4-b387-3901962eaaaa)  
  
### 1.1 Raspberry Pi デバイス  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W  
  
### 1.2 OS  
インストールするOSを選択する。  
  
Other general-purpose OSからDietPiを選択してください。  
  
> [!NOTE]  
> その際、デバイスを正確に選択してください。  
> 例えば、zero w用はzero 2wでは動作しません。   
  
### 1.3 ストレージ  
セットしているmicroSDを選択  
  
> [!CAUTION]  
> これを間違えると、ほかのデバイスにOSを書き込んでしまいます。  
  
### 1.4 microSDにイメージを書き込む  
  
  
### 1.5 Wifi設定を行う。  
  
有線を使用するばあいは、この項をスキップしてください。  
  
以下の2つのファイルを編集してください。  
Windowsの場合はbootfsドライブを認識していると思います。  
  
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
  
初回起動時は領域拡張を行うのでmicroSDのサイズによっては時間がかかります。    
緑のランプが点滅から点灯になるのを待ってください。  
  
## 3. sshでraspberrypiにアクセスする。  
  
ホスト名 dietpi、ユーザ名 rootの場合、ユーザ名@ホスト名  
  
```  
ssh root@dietpi  
```  
でアクセスできます。  
  
## 4. 初期設定を行う。  
  
以下の質問が実行されます。  
  
1) Please enter a new login password for "root" and "dietpi":  
root,dietpi用のパスワードを入力する。  
  
2) Please enter a new default software installation password.  
ソフトウエアインストール用のパスワードを入力する。  
  
3) A serial/UART console is currently enabled, would you like to disable it?   
serial/UARTコンソールは現在有効ですが、無効にしますか？  
  
4) 地域、タイムゾーン等を設定する  
  
dietpi-configが自動で実行されます。                                                                                   ││ Both users still have the default password applied, which needs to be changed for security reasons. ││                                                                                                     ││ Please enter a new login password for "root" and "dietpi":                                          ││                                                                                                     ││ NB: The default SSH server Dropbear does not support passwords over 100 bytes. Certain special      ││ characters, and such with accents, take 2 bytes.  
  
5:Language/Regional Options  
Locale : ja,JP-UTF-8  
Timezone : Asia/Tokyo  
Keyboard : jp  
  
5) 追加ソフトエアを選択する  
  
Search Software  
  
6) Install  
追加のソフトウェア選択をしていない場合は、以下のメッセージが出ます。  
  
Do you wish to continue with DietPi as a pure minimal image?  
DietPiを最小限の構成で使い続けますか？  
  
7) DietPi-Surveyは匿名での利用統計情報を収集します。  
  
1：参加してデータをアップロードする  
0：参加せず、アップロードされたデータを削除する  
  
これで、Dietpiのインストールが終了しました。  
  
8) 一旦再起動します  
  
```  
# reboot  
```  
  
## 5. システムを最新にし、gitアプリをインストールする  
  
dietpiユーザでsshアクセスする。  
  
```  
$ sudo apt-get update && sudo apt-get upgrade -y  
$ sudo apt-get install git -y  
```  
  
## 6. セットアップシェルを実行して、rfriends3をインストールする  
  
```  
$ cd ~/  
$ rm -rf rfriends3_core   
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core  
$ sh install_debian.sh  
```  
  
結構時間がかかります。  
  
  
このメッセージが出たらrfriends3のインストール終了です。  
  
  
## ６．再起動  
  
念のため、一旦再起動してください。  
  
```  
$ sudo reboot  
```  
  
## 7. Webブラウザを使用してrfriends3にアクセスする。  
  
```  
http://rpi-1:8000  
or  
http://xxx.xxx.xxx.xxx:8000  
```  
  
以下のような画面が出たら成功です。  
  
以上  

