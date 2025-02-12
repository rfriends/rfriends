## RaspebrryPi版rfriends3でラジオ録音（OSイメージ編）

あらかじめRaspiOSにrfriends3をインストールし、各種設定を行ったイメージです。  
microSDに書いて起動するだけでrfriends3が使用できます。  
  
## ０．準備   

### 動作確認機種

・Raspberry Pi 
・Raspberry Pi 2
・Raspberry Pi 3 Model B
・Raspberry Pi Zero W/Zero 2W  
  
![1](https://github.com/user-attachments/assets/d30f2827-62d3-4f20-a60e-2bf5e72a6e13)  
  
### Network環境  
  
１）WAN,LAN  
当然ですが、常時外部ネットワークにつながる環境が必要です。ルータ、DHCP等、わかりやすく言えばスマホがWiFi接続できる環境  
  
２）PC  
WindowsPCまたはLinuxPCが必要です。Macでも可能だと思います。Androidでもできないかと試してみましたが、microSDへの書き込みが無理でした。  
稼働後は大丈夫ですが。以下は主にwindowsPCでの操作を記述しています。   
   
### Raspberry pi 一式  
  
・Raspberry Pi 3 Model B または Raspberry Pi Zero W/Zero 2W  
・5V/2.5A ACアダプタ （Zeroの場合は2A）  
注意：低アンペアのアダプタでも動作しますが不安定になる可能性があります。  
・LANケーブル（有線接続の場合）  
・microSDカード Class10 UHS-I（8GB以上、できれば32GB,64GB,128GB）  
・microSDリーダ  
  
必要に応じて  
  
・Raspberry Pi ケース  
・ヒートシンク  
  
### SDカード用ツール  
  
１）SDメモリーカードフォーマッター  
  
SDメモリカードをフォーマットします。  
[sdcard format](https://www.sdcard.org/ja/downloads-2/formatter-2/)    
  
２）Win32DiskImager  
  
イメージをSDメモリカードに書き込みます。  
[win32diskimager](https://sourceforge.net/projects/win32diskimager/)    
  
### ssh,smb,ftpクライアント  
  
WindowsPC環境では、sshはteraterm、smbはPCのエクスプローラ、ftpはfilezilla がおすすめ。  
LinuxPC環境では標準ツールが使えます。  
Android環境では、sshはConnectBot(Kenny Root)、smbはファイルマネージャ＋(flashlihgt+clock)、ftpはFtpCafe(Droidware UK) がおすすめ。  
他の環境の方は、ssh,smb,ftpで検索してください。  
  
## １．rfriends3のシステムイメージをダウンロードする。   

イメージはraspios(Raspios GNU/Linux 11 bullseye lite)上にrfriends3をインストールし各種設定を行ったものです。

下記のリンクを右クリックして「名前をつけてリンク先を保存する」。   
「安全でないダウンロードがブロックされました」と表示されたら「保存」をクリックする。（約1.3GB）  
  
[rfriends3_1.1.4b_raspios_bullseye_lighttpd_20250213.zip](http://rfbuddy.s296.xrea.com/storage/rfriends3_1.1.4b_raspios_bullseye_lighttpd_20250213.zip)    
[wpa_supplicant.conf](http://rfbuddy.s296.xrea.com/storage/wpa_supplicant.conf)  

ブロック等でダウンロードできない方は、以下のGoogleDriveよりダウンロードして下さい。  
[Google Drive](https://drive.google.com/drive/folders/1HF2K38ECkErAscLTCQAhgHwTUo2pSjv4)  
  
## ２．イメージをmicroSDに書く。
  
zipファイルを解凍しimgファイルを抽出する。（約8GB）  
Win32DiskImagerを使って、imgファイルをmicroSDに書く。  
  
![2](https://github.com/user-attachments/assets/c1d4954e-90d6-432a-9d1c-2a8299f77691)  
  
## ３．wifiアクセス情報を追加する。
  
有線LAN接続の場合、この設定は不要です。  
  
イメージを書き込んだmicroSDをPCに接続してください。以下のようなアラーム画面が出ますがキャンセルしてください。フォーマットしてはいけません。ドライブ名は環境により異なります。  
  
![3-1](https://github.com/user-attachments/assets/4870e36e-de56-42a2-bad3-e62ec20d08cd)  
   
エクスプローラで確認すると、bootという領域（fat32フォーマット）が認識されているはずです。  
  
![3-2](https://github.com/user-attachments/assets/3c1c37ef-4dff-4a50-abfc-811db0b19bcb)  
  
wpa_supplicant.confに自環境に合わせてssid,passwdを設定し、microSDに追加する。  
  
```
ctrl_interface=/var/run/wpa_supplicant Group=netdev  
update_config=1  
country=JP  
network={  
ssid="SSID"  
psk="password"  
}
```
（参考）パスワードの暗号化
```
　$ wpa_passphrase "SSID" "password"
```  

## ４．RaspberryPiにmicroSDをセットし起動する。  
  
注意：一度起動すると、wpa_supplicant.conf は　/etc/wpa_supplicantディレクトリに移動し、boot領域からは削除されます。  
設定を間違った場合などで再設定する場合は、wpa_supplicant.conf を再度、boot領域にコピーしてください。  
  
＃# ５．rfriedns3にアクセスする。  
  
Webサーバ（lighttpd）が自動で起動しているので、任意ブラウザでアクセスする。  
http://rfriends3:8000  
  
又はPC等を使用してIPアドレスを調べてアクセスする。  
RaspberrypiはDHCPで動作しています。IPアドレスの確認方法は、下記のようなIP scanner ソフトを使うと便利です。  
android, iPhoneでは、”Fing(無料版)”というアプリがお勧めです。  
  
Advanced IP Scanner  
<http://www.advanced-ip-scanner.com>  
  
スキャン結果より、RFRIENDS3 のものを探してください。(ラズベリーアイコンが表示されているもの)
```
RFRIENDS3 192.168.1.*** Raspberry Pi Foundation B8:27:EB:**:**:**
```
こんな感じで見つかると思います。  
  
![4](https://github.com/user-attachments/assets/90e1c0db-6204-474d-96b3-e7725e2f400f)  
  
## ６．microSDの領域拡張を行う。  
  
提供イメージは領域が縮小されているため、microSD全体を使用するように領域を拡張する必要があります。  
  
メニューより管理-メンテナンス-ラズパイ専用-領域拡張で、microSDの領域拡張を行います。  
一旦再起動します。  
再起動後は領域拡張を行うのでmicroSDのサイズによっては時間がかかります。緑のランプが点滅から点灯になるのを待ってください。  
  
注意：この操作をしないと大容量のmicroSDを使用していても4GB弱しか認識されません。  
再起動後、領域が拡張されたことを確認してください。
  
```
$ df -h
```
  
![5](https://github.com/user-attachments/assets/54b9ce5e-1c96-4b5d-a0b3-3b5812b299ea)  
  
## ７．rfriends3を最新にする。  
  
ヘルプ - システム更新でfriends3を最新にする。  
  
## ８．rfriends3の使い方    
  
### 8.1 使い方
  
使い方について、まずは以下を参照してください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/index.html)   
  
### 8.2 samba
  
PCのエクスプローラから、\\192.168.1.100 でアクセス(smb)することにより録音データにアクセスできます。ほかのアプリを使う場合は、anonymousでアクセスしてください。  
  
![6](https://github.com/user-attachments/assets/9e9dab09-d542-484b-a976-16a74d32ea18)  
  
### 8.3 ftp/sftp  
  
ftp/sftp で192.168.1.100 にアクセスすることによりRaspberry Piに接続できます。  
  
![7](https://github.com/user-attachments/assets/cd253bca-1f68-4266-aa08-34951fd95620)  
  
接続すると、以下のような状態になります。あとは、録音データをD&DすればPC側に転送することができます。  
  
![8](https://github.com/user-attachments/assets/af064ca0-5212-45e3-8503-8fe1f91f80eb)  
  
## ９．最後に  
  
以上で説明は終わりです。
  
おそらく初心者の方にはわかりにくいと思いますが、ネットで勉強しながら頑張ってみるのも楽しいものです。挑戦した方はtwitterで一言コメントを頂ければ幸いです。  
  
当方ではRaspberry Pi 3 Model B/Zeroで１年以上運用しており、問題は生じておりません。ただし、24h稼働になるので、設置場所は火災等にお気を付けください。  
  
このイメージはmicroSDへのアクセスを極力減らすため、  
  
・録音はRAMディスク上で行い、番組終了後microSDにコピーしています。  
・ログ等を極力取らない、あるいはRAMディスク上に取るようにしています。  
  
それでも、microSDの寿命は突然やって来ます。録音データはこまめにバックアップすることをお勧めします。自動でファイルサーバ等にムーブする処理を追加するといいかもしれません。  
  
なお、本イメージを使ったことによる一切の責任は当方にはありません。  
  
## １０．おまけ  
  
### 10.1 Rfriends2/3 for Raspberry Pi イメージの作り方  
  
イメージ作成は以下の手順で行いました。当方で稼働しているラジオサーバは32GBのmicroSDで運用しています。これをそのままイメージ化すると大きくなりすぎます。  
そこで、  
  
１）データ整理  
録音データを他に退避後、消去しました。  
  
２）領域縮小  
gparted で領域を約3GBに縮小しました。  
  
３）使用領域調査  
```
$ sudo fdisk -l /dev/sdb
```
により使用している領域を把握  
  
４）イメージのバックアップ  
  
```
$ sudo dd if=/dev/sdb of=***/rfriends*.img count=****** bs=512
```
  
でイメージのバックアップを取りました。  
  
５）完成  
これにより、4GBのmicroSDでも使用できるイメージ（約 3.1GB）が作成できました。  
  
６）アップロード  
できたイメージをzipに圧縮（約 1.6GB）し、GoogleDriveにアップロードしました。  
  
GoogleDriveはサイズ制限が少ないので。  

### 10.２ Raspberry Pi Zero Wの温度  
  
![9](https://github.com/user-attachments/assets/c3e978ce-aff9-4355-be10-a358d6f77a8d)  
  
・アイドル時  
使用電流 : 約40mA  
CPU温度 : 40.1’C  
  
・タイムフリー一括ダウンロード時  
使用電流 : 約140mA  
CPU温度 : 48.7’C  
  
CPU温度は以下のコマンドで取得できます。  
```
$ vcgencmd measure_temp
temp=48.7’C
```
  
以上
  
