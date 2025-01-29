## rfriends3 for RaspebrryPiの使用方法（OSイメージ編）
  
  
## ０．準備   

### 動作確認機種

・Raspberry Pi 
・Raspberry Pi 2
・Raspberry Pi 3 Model B
・Raspberry Pi Zero W/Zero 2W
![20190821112722](https://github.com/user-attachments/assets/182b6c43-674a-4590-bd99-aaff592a810e)

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
https://www.sdcard.org/ja/downloads-2/formatter-2/  
  
２）Win32DiskImager  
  
イメージをSDメモリカードに書き込みます。  
https://ja.osdn.net/projects/sfnet_win32diskimager/releases/  
  
### ssh,smb,ftpクライアント  
  
WindowsPC環境では、sshはteraterm、smbはPCのエクスプローラ、ftpはfilezilla がおすすめ。  
LinuxPC環境では標準ツールが使えます。  
Android環境では、sshはConnectBot(Kenny Root)、smbはファイルマネージャ＋(flashlihgt+clock)、ftpはFtpCafe(Droidware UK) がおすすめ。  
他の環境の方は、ssh,smb,ftpで検索してください。  
  
## １．rfriends3のシステムイメージをダウンロードする。   

イメージはraspios(Raspios GNU/Linux 11 bullseye lite)上にrfriends3をインストールし各種設定を行ったものです。

下記のリンクを右クリックして「名前をつけてリンク先を保存する」。   
「安全でないダウンロードがブロックされました」と表示されたら「保存」をクリックする。（約1.3GB）  
  
http://rfbuddy.s296.xrea.com/storage/rfriends3_1.1.2-a06_raspios_bullseye_lighttpd_20241105.zip
http://rfbuddy.s296.xrea.com/storage/wpa_supplicant.conf
  
## ２．イメージをmicroSDに書く。
  
zipファイルを解凍しimgファイルを抽出する。（約8GB）  
Win32DiskImagerを使って、imgファイルをmicroSDに書く。  
![20190821130510](https://github.com/user-attachments/assets/2dd51053-0167-4e91-a4cc-ed2f91ab1ab9)

  
## ３．wifiアクセス情報を追加する。
  
有線LAN接続の場合、この設定は不要です。  
  
イメージを書き込んだmicroSDをPCに接続してください。以下のようなアラーム画面が出ますがキャンセルしてください。フォーマットしてはいけません。ドライブ名は環境により異なります。  
![20190821143217](https://github.com/user-attachments/assets/b491c444-7b8c-4ba9-bfb4-5ae3574c7e7e)
  
エクスプローラで確認すると、bootという領域（fat32フォーマット）が認識されているはずです。  
  
![20190821143153-500x74](https://github.com/user-attachments/assets/90116423-abcc-4edc-9ae2-1270b8b155d0)
  

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
http://www.advanced-ip-scanner.com  
  
スキャン結果より、RFRIENDS3 のものを探してください。(ラズベリーアイコンが表示されているもの)
```
RFRIENDS3 192.168.1.*** Raspberry Pi Foundation B8:27:EB:**:**:**
```
こんな感じで見つかると思います。  
![20230720011542-500x392](https://github.com/user-attachments/assets/554e93f2-2fa6-4baf-898c-2e88f568011d)

  
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
![disksize-500x342](https://github.com/user-attachments/assets/be81c544-1f90-441f-8cf9-6029810280e1)

  
## ７．rfriends3を最新にする。  
  
ヘルプ - システム更新でfriends3を最新にする。  
  
## ８．rfriends3の使い方    
  
### 8.1 使い方
  
使い方について、まずは以下を参照してください。  
[チュートリアル](https://github.com/rfriends/rfriends3/wiki/%EF%BC%90%EF%BC%90%EF%BC%8E%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)  
  
### 8.2 samba
  
PCのエクスプローラから、\\192.168.1.100 でアクセス(smb)することにより録音データにアクセスできます。ほかのアプリを使う場合は、anonymousでアクセスしてください。  
![20190821111224](https://github.com/user-attachments/assets/45380b02-7afd-4c11-adb8-20f9279b766b)

  
### 8.3 ftp/sftp  
  
ftp/sftp で192.168.1.100 にアクセスすることによりRaspberry Piに接続できます。  

  
![20190823044236](https://github.com/user-attachments/assets/cb3aa3a5-5848-4c4f-a758-fa431446a730)


接続すると、以下のような状態になります。あとは、録音データをD&DすればPC側に転送することができます。  
![20190823045059](https://github.com/user-attachments/assets/64dcef7b-b3d4-4894-a65a-a42eea7d8d02)

  
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
  
![20190821112437](https://github.com/user-attachments/assets/4b118c10-94c6-4010-b362-149014ac95be)

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


