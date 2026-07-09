# RaspberryPi版rfriends3でラジオ録音（OSイメージ編）
あらかじめRaspiOSにrfriends3をインストールし、各種設定を行ったイメージです。
microSDに書いて起動するだけでrfriends3が使用できます。

> [!NOTE]
> 2026/05/05
> ドキュメントを大幅書き換え。
> Bookworm版(32/64)を公開しました。

## ０．準備  
  
動作確認機種  
・Raspberry Pi 1/2/3/4  
・Raspberry Pi Zero W/Zero 2W  
  
当方、Raspberry Pi 5 を所持していないため確認できていません。  
  
WindowsPC/LinuxPC/Macを用意してください。  
以下は主にWindowsPCでの操作を記述しています。  
  
## １．rfriends3のシステムイメージをダウンロードする。  
  
イメージはraspios上にrfriends3をインストールし各種設定を行ったものです。
リンクを右クリックして「名前をつけてリンク先を保存する」。
XXXXX.img.gzファイルが保存されますが、解凍の必要はありません。

- Raspios GNU/Linux 12 bookworm lite  
  
32bit版(全モデル)  
1.4.3a  
[rfriends3_1.4.3a_raspios_bookworm_202605052124.img.gz](https://ss1.xrea.com/rf3.s331.xrea.com/storage/rfriends3_1.4.3a_raspios_bookworm_202605052124.img.gz)  
  
64bit版(3/4/zero2)  
1.5.0d  
[rfriends3_1.5.0d_raspios_bookworm_64_202607090451.img.gz](https://ss1.xrea.com/rf3.s331.xrea.com/storage/rfriends3_1.5.0d_raspios_bookworm_64_202607090451.img.gz)  
  
## ２．イメージをmicroSDに書く。(Windows,Linux,macOS)  
  
以下のページを参考にして、imgファイルをmicroSDに書く。  
  
[Raspberry Pi Imagerを使用してカスタムイメージをmicroSDに書く](https://github.com/rfriends/rfriends/blob/gh-pages/distro/raspi_image.html)
  

## ３．wifiアクセス情報を追加する。  
  
有線LAN接続の場合、この設定は不要です。  
  
> [!NOTE]  
> bookwormからwifi設定の方法が変更になっていますが  
> 従来の方法でできるよう変更しています。  
  
### 3.1 Wifi設定ファイル作成  
  
下記のリンクを右クリックして「名前をつけてリンク先を保存する」。
[wpa_supplicant.conf](https://ss1.xrea.com/rf3.s331.xrea.com/storage/wpa_supplicant.conf)  
  
保存したwpa_supplicant.confに自環境に合わせてssid,passwdを設定する。  
```    
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev  
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
この時は
  psk=password
になります。””はつけない  
```  
  
### 3.2 Wifi設定ファイルをmicroSDにコピー
  
2.で作成したmicroSDをPCに接続してください。  
  
エクスプローラで確認すると、boot/bootfs領域（この例ではF:、環境によりドライブ名は異なる）が認識されているはずです。  
  
<img width="416" height="60" alt="c2" src="https://github.com/user-attachments/assets/eb5f4225-9b71-48b8-ad59-ec613162c256" />
  
このmicroSDのboot/bootfs領域（この例ではF:\）にwpa_supplicant.confをコピーする。  
  
<img width="1056" height="364" alt="c" src="https://github.com/user-attachments/assets/50ca81b7-c4cc-4968-9b1c-e04a9d5b781a" />
  
## ４．起動    
  
RaspberryPiにmicroSDをセットし電源をONにします。  
RaspberryPiのLEDが点滅し、しばらくすると点灯に変わります。 
この時点でOSは起動し、rfriends3は実行されています。  
  
注意：一度起動すると、wpa_supplicant.conf は　/etc/wpa_supplicantディレクトリに移動し、boot/bootfs領域からは削除されます。  
設定を間違った場合などで再設定する場合は、wpa_supplicant.conf を修正後、再度、boot/bootfs領域にコピーしてください。  
  
## ５．rfriends3にアクセスする。  
  
Webサーバ（lighttpd/apache2）が自動で起動しているので、任意ブラウザでアクセスする。  
32bit版　http://rpi-bookworm:8000   
または  
64bit版　http://rfriends3:8000   
  
アクセスに成功すると、ブラウザにこんな感じで表示されると思います。  
  
<img width="389" height="394" alt="rf3-3" src="https://github.com/user-attachments/assets/8928226e-996e-412e-ba7a-17b0428bb892" />
  
  
**うまくつながらない場合は、３．をやり直してください。**   
    
また、すでにrpiイメージのマシンが稼働している場合は、PC等を使用してIPアドレスを調べてアクセスする必要があります。  
RaspberrypiはDHCPで動作しています。IPアドレスの確認方法は、下記のようなIP scanner ソフトを使うと便利です。  
android, iPhoneでは、”Fing(無料版)”というアプリがお勧めです。  
  
Advanced IP Scanner  
<http://www.advanced-ip-scanner.com>  
  
スキャン結果より、RFRIENDS3 / RF3-BOOKWORM / RF3-TRIXE のものを探してください。(ラズベリーアイコンが表示されているもの)
RFRIENDS3 192.168.1.*** Raspberry Pi Foundation B8:27:EB:::**



  
## ６．microSDの領域拡張を行う。  
  
提供イメージは領域が縮小されているため、microSD全体を使用するように領域を拡張する必要があります。  
  
メニューより管理-メンテナンス-ラズパイ専用-領域拡張で、microSDの領域拡張を行います。  
一旦再起動します。  
再起動後は領域拡張を行うのでmicroSDのサイズによっては時間がかかります。緑のランプが点滅から点灯になるのを待ってください。  
  
注意：この操作をしないと大容量のmicroSDを使用していても8GB弱しか認識されません。  
再起動後、領域が拡張されたことを確認してください。  
以下の例は64GBのmicroSDです。  
  
<img width="162" height="88" alt="rf3-2" src="https://github.com/user-attachments/assets/591742d6-921c-4d2b-85d6-d369c0227e30" />
 
  
## ７．rfriends3を最新にする。  
  
ヘルプ - システム更新でfriends3を最新にする。  
  
## ８．rfriends3の使い方    
  
### 8.1 使い方
  
使い方について、まずは以下を参照してください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/index.html)   
  
### 8.2 samba
  
PCのエクスプローラから、\\\\ (raspberry piのipアドレス) でアクセス(smb)することにより録音データにアクセスできます。ほかのアプリを使う場合は、anonymousでアクセスしてください。  
  
![6](https://github.com/user-attachments/assets/9e9dab09-d542-484b-a976-16a74d32ea18)  
  
### 8.3 ftp/sftp  
  
ftp/sftp で(raspberry piのipアドレス)にアクセスすることによりRaspberry Piに接続できます。  
  
![7](https://github.com/user-attachments/assets/cd253bca-1f68-4266-aa08-34951fd95620)  
  
接続すると、以下のような状態になります。あとは、録音データをD&DすればPC側に転送することができます。  
  
![8](https://github.com/user-attachments/assets/af064ca0-5212-45e3-8503-8fe1f91f80eb)  
  
## ９．最後に  
  
以上で説明は終わりです。
  
当方ではRaspberry Pi 3 Model B/Zeroで１年以上運用しており、問題は生じておりません。ただし、24h稼働になるので、設置場所は火災等にお気を付けください。  
  
このイメージはmicroSDへのアクセスを極力減らす設定をしていますが、  
それでも、microSDの寿命は突然やって来ます。録音データはこまめにバックアップすることをお勧めします。  
自動でファイルサーバ等にムーブする処理を追加するといいかもしれません。  
  
なお、お約束ですが本イメージを使ったことによる一切の責任は当方にはありません。  
自己責任でお願いします。  
  
## １０．おまけ  
  
・raspberry Pi Zero Wの温度  
  
![9](https://github.com/user-attachments/assets/c3e978ce-aff9-4355-be10-a358d6f77a8d)  
  
・アイドル時  
使用電流 : 約40mA  
CPU温度 : 40.1’C  
  
・タイムフリー一括ダウンロード時  
使用電流 : 約140mA  
CPU温度 : 48.7’C  
  
CPU温度は以下のコマンドで取得できます。  
$ vcgencmd measure_temp temp=48.7’C
  
以上    
  
