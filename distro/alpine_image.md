## Alpine Linux (Raspberry Pi)版rfriends3でラジオ録音

あらかじめAlpine Linuxにrfriends3をインストールし、各種設定を行ったイメージです。  
microSDに書いてRaspberryPiを起動するだけでrfriends3が使用できます。  
  
初版 2025/08/30  
改版 2025/10/11
  
## ０．準備   

### 動作確認機種
  
> [!CAUTION]  
> armhf版はzero専用で、zero2では動作しません。
> （raspiosは兼用できるのですが、alpineではできません）
  
https://alpinelinux.org/downloads/   
  
1) armhf

[alpine-rpi-3.22.2-armhf.tar.gz](https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armv7/alpine-rpi-3.22.2-armhf.tar.gz)  
   
・Raspberry Pi Zero W  
  
2) armv7
  
[alpine-rpi-3.22.2-armv7.tar.gz](https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armv7/alpine-rpi-3.22.2-armv7.tar.gz)  
   
・Raspberry Pi 3 Model B  
・Raspberry Pi Zero 2 W  
  
### Raspberry pi 一式  
  
・Raspberry Pi (動作確認機種)   
・ACアダプタ   
・LANケーブル（有線接続の場合）  
・microSDカード Class10 UHS-I（8GB以上、できれば32GB,64GB,128GB）  
・microSDリーダ  
  
  
### SDカード用ツール  
  
１）SDメモリーカードフォーマッター  
    
[SD Card FOrmatter](https://www.sdcard.org/ja/downloads-2/formatter-2/)  
  
２）Win32DiskImager  
  
イメージをSDメモリカードに書き込みます。  
[win32diskimager](https://sourceforge.net/projects/win32diskimager/)    
  
### sshクライアント  
  
WindowsPC環境では、sshはteratermまたはrloginがおすすめ。  
Windows標準のターミナルからもアクセスできます。  
LinuxPC環境では標準ツールが使えます。  
  
## １．rfriends3のシステムイメージをダウンロードする。   
  
イメージはAlpine Linux上にrfriends3をインストールし各種設定を行ったものです。  
以下の2つのファイルを入手してください。  
  
下記のリンクを右クリックして「名前をつけてリンク先を保存する」。   
「安全でないダウンロードがブロックされました」と表示されたら「保存」をクリックする。（約500MB）  

armhf (現在、公開停止中)
~~[rpi-rfriends3-alpinev6.zip](http://rf3.s331.xrea.com/storage/rpi-rfriends3-alpinev6.zip)~~ （約 340MB）  
または  
armv7
[rpi-rfriends3-alpinev7.zip](https://ss1.xrea.com/rf3.s331.xrea.com/storage/rpi-rfriends3-alpinev7.zip) （約 701MB）  
  
[wpa_supplicant.conf](https://ss1.xrea.com/rf3.s331.xrea.com/storage/wpa_supplicant.conf)  
  
## ２．イメージをmicroSDに書く。
  
zipファイルを解凍しimgファイルを抽出する。（約6GB）  
rpi-rfriends3-alpine.img (ファイル名はバージョンにより異なります)  
   
Win32DiskImagerを使って、imgファイルをmicroSDに書く。  
  
![2](https://github.com/user-attachments/assets/c1d4954e-90d6-432a-9d1c-2a8299f77691)  
  
## ３．wifiアクセス情報を追加する。
  
有線LAN接続の場合、この設定は不要です。  
  
### 3.1 wpa_supplicant.confに自環境に合わせてssid,passwordを設定する。  
  
```
ctrl_interface=/var/run/wpa_supplicant Group=netdev  
update_config=1  
country=JP  
network={  
ssid="ssid"  
psk="password"  
}
```
（参考）パスワードの暗号化
```
　$ wpa_passphrase "SSID" "password"
```
  
### 3.2 イメージを書き込んだmicroSDを再度PCに接続してください。ドライブ名は環境により異なります。  
  
![clip_1](https://github.com/user-attachments/assets/8226bf3c-8eb2-411a-8df8-8fc8091b2428)  
  
設定したwpa_supplicant.confをmicroSDにD&Dして追加してください。 

## ４．RaspberryPiにmicroSDをセットし起動する。  
  
wpa_supplicant.confの設定が正しければ、IPアドレスが割り当てられ、rfriends3にアクセスできるようになります。  
初回は少し時間がかかるかもしれません。(1分くらい？)  
初期のログインパスワードは、rpi/rfriends です。（セキュリティのため変更してください）
  
![boot](https://github.com/user-attachments/assets/b158cfce-9ed4-4350-898d-85011afb258e)  
  
  
> [!NOTE]  
> 一度起動すると、wpa_supplicant.conf は　/etc/wpa_supplicantディレクトリに移動し、boot領域からは削除されます。
> 設定を間違った場合などで再設定する場合は、wpa_supplicant.conf を再度、boot領域にコピーしてください。  
  
## ５．microSDの領域拡張を行う。  
  
提供イメージは領域が縮小されているため、microSD全体を使用するように領域を拡張する必要があります。  
  
> [!CAUTION]  
> この操作をしないと大容量のmicroSDを使用していても5GB弱しか認識されません。  
    
teratermやrlogin等のSSHクライアントを使ってsshアクセスします。 
次に、expandを実行します。  
  
```  
$ cd ~/setup
$ sh expand.sh  
```  
  
> [!CAUTION]  
> もし、以下のようなメッセージが出る場合、
> ```
> umount: can't unmount /home/rpi/smbdir: Resource busy
> ```
> 一旦システムを再起動して、その後、すぐにexpand.shを再実行してください。  
　　
    
拡張が成功したら、再起動します。
```
$ sudo reboot  
```  

## ６．rfriedns3にアクセスする。  
  
Webサーバ（lighttpd）が自動で起動しているので、任意ブラウザでアクセスする。  
  
```  
http://rfriends3:8000  
```
    
又はPC等を使用してIPアドレスを調べてアクセスする。  
RaspberrypiはDHCPで動作しています。IPアドレスの確認方法は、下記のようなIP scanner ソフトを使うと便利です。  
android, iPhoneでは、”Fing(無料版)”というアプリがお勧めです。  
  
Advanced IP Scanner  
<http://www.advanced-ip-scanner.com>  
  
スキャン結果より、rfriends3 のものを探してください。(ラズベリーアイコンが表示されているもの)  
こんな感じで見つかると思います。  
  
```
rfriends3 192.168.1.*** Raspberry Pi Foundation B8:27:EB:**:**:**
```  
  
![rf](https://github.com/user-attachments/assets/13c3595d-c7a9-44ca-8c44-fedf9214b0a5)  
  
  
 
## ７．rfriends3を最新にする。  
  
ヘルプ - システム更新でfriends3を最新にする。  
  
## ８．rfriends3の使い方    
  
### 8.1 使い方
  
使い方について、まずは以下を参照してください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/index.html)   
  
### 8.2 samba
  
PCのエクスプローラから、\\\\rfriends3 または \\\\IPアドレス でアクセス(smb)することにより録音データにアクセスできます。(\は￥)  
ほかのアプリを使う場合は、anonymousでアクセスしてください。  
  
![6](https://github.com/user-attachments/assets/9e9dab09-d542-484b-a976-16a74d32ea18)  
  
### 8.3 ftp/sftp  
  
ftp/sftp でalpv6/alpv7 にアクセスすることによりRaspberry Piに接続できます。  
  
![7](https://github.com/user-attachments/assets/cd253bca-1f68-4266-aa08-34951fd95620)  
  
接続すると、以下のような状態になります。あとは、録音データをD&DすればPC側に転送することができます。  
  
![8](https://github.com/user-attachments/assets/af064ca0-5212-45e3-8503-8fe1f91f80eb)  
  
## ９．最後に  
  
以上で説明は終わりです。
  
microSDの寿命は突然やって来ます。録音データはこまめにバックアップすることをお勧めします。自動でファイルサーバ等にムーブする処理を追加するといいかもしれません。  
  
なお、本イメージを使ったことによる一切の責任は当方にはありません。  
  

  
以上
  
