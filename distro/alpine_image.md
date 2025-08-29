## Alpine Linux版rfriends3でラジオ録音（OSイメージ編）

あらかじめAlpine Linuxにrfriends3をインストールし、各種設定を行ったイメージです。  
microSDに書いて起動するだけでrfriends3が使用できます。  
  
## ０．準備   

### 動作確認機種
  
Alpine Linuxはarm7用を使用しています。  
https://alpinelinux.org/downloads/  
[alpine-rpi-3.22.1-armv7.tar.gz](https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armv7/alpine-rpi-3.22.1-armv7.tar.gz)  
   
・Raspberry Pi 3 Model B  
・Raspberry Pi Zero 2 W  
  
### Raspberry pi 一式  
  
・Raspberry Pi (動作確認機種)   
・ACアダプタ   
注意：低アンペアのアダプタでも動作しますが不安定になる可能性があります。  
・LANケーブル（有線接続の場合）  
・microSDカード Class10 UHS-I（8GB以上、できれば32GB,64GB,128GB）  
・microSDリーダ  
  
  
### SDカード用ツール  
  
１）SDメモリーカードフォーマッター  
  
SDメモリカードをフォーマットします。  
[sdcard format](https://www.sdcard.org/ja/downloads-2/formatter-2/)    
  
２）Win32DiskImager  
  
イメージをSDメモリカードに書き込みます。  
[win32diskimager](https://sourceforge.net/projects/win32diskimager/)    
  
### sshクライアント  
  
WindowsPC環境では、sshはteratermまたはrloginがおすすめ。  
LinuxPC環境では標準ツールが使えます。  
  
## １．rfriends3のシステムイメージをダウンロードする。   
  
イメージはAlpine Linux上にrfriends3をインストールし各種設定を行ったものです。  
以下の2つのファイルを入手してください。  
  
下記のリンクを右クリックして「名前をつけてリンク先を保存する」。   
「安全でないダウンロードがブロックされました」と表示されたら「保存」をクリックする。（約500MB）  
  
[rpi_rfriends3_alpine.zip](http://rf3.s331.xrea.com/storage/rpi_rfriends3_alpine.zip) （約 530MB）  
[wpa_supplicant.conf](http://rf3.s331.xrea.com/storage/wpa_supplicant.conf)  
  
## ２．イメージをmicroSDに書く。
  
zipファイルを解凍しimgファイルを抽出する。（約8GB）  
rpi_rfriends3_alpine.img  
   
Win32DiskImagerを使って、imgファイルをmicroSDに書く。  
  
![2](https://github.com/user-attachments/assets/c1d4954e-90d6-432a-9d1c-2a8299f77691)  
  
## ３．wifiアクセス情報を追加する。
  
有線LAN接続の場合、この設定は不要です。  
  
### 3.1 wpa_supplicant.confに自環境に合わせてssid,passwdを設定する。  
  
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
  
### 3.2 イメージを書き込んだmicroSDを再度PCに接続してください。ドライブ名は環境により異なります。  
  
![3-1](https://github.com/user-attachments/assets/4870e36e-de56-42a2-bad3-e62ec20d08cd)  
   
エクスプローラで確認すると、bootという領域（fat32フォーマット）が認識されているはずです。  
  
![3-2](https://github.com/user-attachments/assets/3c1c37ef-4dff-4a50-abfc-811db0b19bcb)  
  
設定したwpa_supplicant.confをmicroSDにD&Dして追加してください。 

## ４．RaspberryPiにmicroSDをセットし起動する。  
  
注意：一度起動すると、wpa_supplicant.conf は　/etc/wpa_supplicantディレクトリに移動し、boot領域からは削除されます。  
設定を間違った場合などで再設定する場合は、wpa_supplicant.conf を再度、boot領域にコピーしてください。  
  
＃# ５．rfriedns3にアクセスする。  
  
Webサーバ（lighttpd）が自動で起動しているので、任意ブラウザでアクセスする。  
http://alpv7:8000  
  
又はPC等を使用してIPアドレスを調べてアクセスする。  
RaspberrypiはDHCPで動作しています。IPアドレスの確認方法は、下記のようなIP scanner ソフトを使うと便利です。  
android, iPhoneでは、”Fing(無料版)”というアプリがお勧めです。  
  
Advanced IP Scanner  
<http://www.advanced-ip-scanner.com>  
  
スキャン結果より、alpv7 のものを探してください。(ラズベリーアイコンが表示されているもの)
```
alpv7 192.168.1.*** Raspberry Pi Foundation B8:27:EB:**:**:**
```
こんな感じで見つかると思います。  
  
![4](https://github.com/user-attachments/assets/90e1c0db-6204-474d-96b3-e7725e2f400f)  
  
## ６．microSDの領域拡張を行う。  
  
提供イメージは領域が縮小されているため、microSD全体を使用するように領域を拡張する必要があります。  
注意：この操作をしないと大容量のmicroSDを使用していても8GB弱しか認識されません。  
    
sshアクセスします。  
  
### 6.1 cfdiskによるパーティション拡張  
  
1) cfdiskの起動
  
/dev/mmcblk02が約7GBであることを確認  
  
```  
$ df  
```  
  
cfdiskを起動する。
  
```  
$ sudo cfdisk /dev/mmcblk0  
```
![cf00](https://github.com/user-attachments/assets/9cc29f8d-0e7b-4f71-98d9-b29900d80116)

2) パーティション拡張
  
上下カーソルで/dev/mmcblk0p2を選択する。  
左右カーソルで[Resize]を選択し、リターンを押下する。  
![cf01](https://github.com/user-attachments/assets/c2ac3b84-8f8e-45c5-bceb-8e8ea122ff6c)  
  

使用しているmicroSDの最大サイズ（下記は６４GBの例）が表示されるので、そのままリターンを押下する。
New size:57.6G
  
![cf02](https://github.com/user-attachments/assets/9e2a3404-f6d2-4175-966f-dcb529952904)  
  
左右カーソルで[Write]を選択し、リターンを押下する。  
  
![cf03](https://github.com/user-attachments/assets/94ffad45-b679-46e2-9ab5-d053a7f30039)   
  
Are you sure you want to write the partition table to disk ?  
（パーティションテーブルをディスクに書き込んでもいいですか？）  
と表示されるので、yes(リターン)を押下する。  
  
![cf04](https://github.com/user-attachments/assets/175cd953-b029-465a-a9e8-22dedbc27e29)  
    
左右カーソルで[QUit]を選択し、リターンを押下する。  
  
![cf05](https://github.com/user-attachments/assets/b99bde9f-e0eb-4db3-bfaf-10619c3b8364)  
  

### 6.2 resize2fsによるディスクサイズ変更
```
$ sudo resize2fs /dev/mmcblk0p2
```
実際にディスクサイズが変更されます。
```
$ df
```  
で確認すると、
/dev/mmcblk02が約60GBであることを確認（microSDが64GBの場合）
    
![cf06](https://github.com/user-attachments/assets/b5588cf0-168a-4318-b41d-66feb976d34c)  
  
  
一旦再起動します。
```
$ sudo reboot  
```
  

  
  
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
  
