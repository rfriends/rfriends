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
  
> [!NOTE]  
> その際、デバイスを正確に選択してください。  
> 例えば、zero w用はzero 2wでは動作しません。

### 1.2 OS  
インストールするOSを選択する。  
  
Other general-purpose OSからDietPiを選択してください。  
<img width="682" height="482" alt="clip_4" src="https://github.com/user-attachments/assets/c5daceb7-8931-4f91-bae1-7aace0c707ad" />

  
### 1.3 ストレージ  
セットしているmicroSDを選択  
  
> [!CAUTION]  
> これを間違えると、ほかのデバイスにOSを書き込んでしまいます。  
  
### 1.4 microSDにイメージを書き込む  
  
  
### 1.5 Wifi設定を行う。  
  
有線を使用するばあいは、この項をスキップしてください。  
  
以下の2つのファイルを編集してください。  
Windowsの場合はbootfsドライブを認識していると思います。  
<img width="437" height="69" alt="clip_12" src="https://github.com/user-attachments/assets/11c10a0d-1920-4a8d-b9e2-5aa1381c6683" />


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
  
次に、dietpi-softwareが自動起動される。  
  
<img width="600" height="372" alt="clip_13" src="https://github.com/user-attachments/assets/2e4e0f69-6c94-4f53-ab9d-619848c8843a" />
  
4) Languageを選択し、地域、タイムゾーン等を設定する  
  
5:Language/Regional Options  
Locale : ja,JP-UTF-8  
Timezone : Asia/Tokyo  
Keyboard : jp  
  
5) Search Softwareを選択し、追加ソフトエアを選択する  
  
6) Installを選択  
    
追加のソフトウェア選択をしていない場合は、以下のメッセージが出る。  
  
Do you wish to continue with DietPi as a pure minimal image?  
DietPiを最小限の構成で使い続けますか？  
  
7) DietPi-Survey
  
Installが終了すると、diet-Surveyの質問がでる。
  
匿名での利用統計情報を収集する。  
  
1：参加してデータをアップロードする  
0：参加せず、アップロードされたデータを削除する  
  
これで、Dietpiのインストールが終了。  
  
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
  <img width="1370" height="850" alt="clip_13" src="https://github.com/user-attachments/assets/74a227da-61f7-4b2e-86ef-8f622a2818aa" />

```  
http://rpi-1:8000  
or  
http://xxx.xxx.xxx.xxx:8000  
```  
  
以下のような画面が出たら成功です。  
  
以上  
  

