## Alpine Linux (Raspberry Pi)版rfriends3でラジオ録音

あらかじめAlpine Linuxにrfriends3をインストールし、各種設定を行ったイメージです。  
microSDに書いてRaspberryPiを起動するだけでrfriends3が使用できます。  
  
初版 2025/08/30  
改版 2025/09/02
  
## ０．準備   

### 動作確認機種
  
> [!CAUTION]  
> armhf版はzero専用で、zero2では動作しません。
> （raspiosは兼用できるのですが、alpineではできません）
  
https://alpinelinux.org/downloads/   
  
1) armhf

[alpine-rpi-3.22.1-armhf.tar.gz](https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armv7/alpine-rpi-3.22.1-armhf.tar.gz)  
   
・Raspberry Pi Zero W  
  
2) armv7
  
[alpine-rpi-3.22.1-armv7.tar.gz](https://dl-cdn.alpinelinux.org/alpine/v3.22/releases/armv7/alpine-rpi-3.22.1-armv7.tar.gz)  
   
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
  
> [!CAUTION]  
> 32GB以上のディスク領域をFAT32形式でフォーマットできるソフトが必要です。  
  
[Fat32Formatter](https://forest.watch.impress.co.jp/library/software/fat32format/)
  

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

armhf
[rpi-rfriends3-alpinev6.zip](http://rf3.s331.xrea.com/storage/rpi-rfriends3-alpinev6.zip) （約 340MB）  
または  
armv7
[rpi-rfriends3-alpinev7.zip](http://rf3.s331.xrea.com/storage/rpi-rfriends3-alpinev7.zip) （約 530MB）  
  
[wpa_supplicant.conf](http://rf3.s331.xrea.com/storage/wpa_supplicant.conf)  
  
## ２．イメージをmicroSDに書く。
  
zipファイルを解凍しimgファイルを抽出する。（約8GB）  
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
  
## ５．rfriedns3にアクセスする。  
  
Webサーバ（lighttpd）が自動で起動しているので、任意ブラウザでアクセスする。  
  
```  
http://alpv6:8000  
または  
http://alpv7:8000  
```
    
又はPC等を使用してIPアドレスを調べてアクセスする。  
RaspberrypiはDHCPで動作しています。IPアドレスの確認方法は、下記のようなIP scanner ソフトを使うと便利です。  
android, iPhoneでは、”Fing(無料版)”というアプリがお勧めです。  
  
Advanced IP Scanner  
<http://www.advanced-ip-scanner.com>  
  
スキャン結果より、alpv6/alpv7 のものを探してください。(ラズベリーアイコンが表示されているもの)  
こんな感じで見つかると思います。  
  
```
alpv7 192.168.1.*** Raspberry Pi Foundation B8:27:EB:**:**:**
```  
  
![rf](https://github.com/user-attachments/assets/13c3595d-c7a9-44ca-8c44-fedf9214b0a5)  
  
  
## ６．microSDの領域拡張を行う。  
  
提供イメージは領域が縮小されているため、microSD全体を使用するように領域を拡張する必要があります。  
  
> [!CAUTION]  
> この操作をしないと大容量のmicroSDを使用していても8GB弱しか認識されません。  
    
teratermやrlogin等のSSHクライアントを使ってsshアクセスします。  
  
### 6.1 cfdiskによるパーティション拡張  
  
1) 現状確認  
  
/dev/mmcblk02が約7GBであることを確認  
  
```  
$ df  
```  
  ![cf00a](https://github.com/user-attachments/assets/1e544997-0abc-4327-a8c9-30f1032c23e5)

2) パーティション拡張
  
cfdiskを起動する。
  
```  
$ sudo cfdisk /dev/mmcblk0  
```


上下カーソルで/dev/mmcblk0p2を選択する。  
左右カーソルで[Resize]を選択し、(リターン)を押下する。  
![cf01](https://github.com/user-attachments/assets/c2ac3b84-8f8e-45c5-bceb-8e8ea122ff6c)  
  

使用しているmicroSDの最大サイズ（下記は64GBの例）が表示されるので、そのまま(リターン)を押下する。  
New size:57.6G  
  
![cf02](https://github.com/user-attachments/assets/9e2a3404-f6d2-4175-966f-dcb529952904)  
  
左右カーソルで[Write]を選択し、(リターン)を押下する。  
  
![cf03](https://github.com/user-attachments/assets/94ffad45-b679-46e2-9ab5-d053a7f30039)   
  
Are you sure you want to write the partition table to disk ?  
（パーティションテーブルをディスクに書き込んでもいいですか？）  
と表示されるので、yes(リターン)を押下する。  
  
![cf04](https://github.com/user-attachments/assets/175cd953-b029-465a-a9e8-22dedbc27e29)  
    
左右カーソルで[Quit]を選択し、(リターン)を押下する。  
  
![cf05](https://github.com/user-attachments/assets/b99bde9f-e0eb-4db3-bfaf-10619c3b8364)  
  

### 6.2 resize2fsによるディスクサイズ変更
```
$ sudo resize2fs /dev/mmcblk0p2
```
実際にディスクサイズが変更されます。
![cf06a](https://github.com/user-attachments/assets/62f84705-c469-4389-bfae-07904d24b99d)

```
$ df
```  
で確認すると、
/dev/mmcblk02が約60GBであることを確認（microSDが64GBの場合）
    
![cf06b](https://github.com/user-attachments/assets/457e5a56-f4bd-4c62-9ab2-8f142e6145c2)

  
  
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
  
PCのエクスプローラから、\\\\alpv6 または \\\\alpv7 でアクセス(smb)することにより録音データにアクセスできます。(\は￥)  
ほかのアプリを使う場合は、anonymousでアクセスしてください。  
  
![6](https://github.com/user-attachments/assets/9e9dab09-d542-484b-a976-16a74d32ea18)  
  
### 8.3 ftp/sftp  
  
ftp/sftp でalpv7 にアクセスすることによりRaspberry Piに接続できます。  
  
![7](https://github.com/user-attachments/assets/cd253bca-1f68-4266-aa08-34951fd95620)  
  
接続すると、以下のような状態になります。あとは、録音データをD&DすればPC側に転送することができます。  
  
![8](https://github.com/user-attachments/assets/af064ca0-5212-45e3-8503-8fe1f91f80eb)  
  
## ９．最後に  
  
以上で説明は終わりです。
  
microSDの寿命は突然やって来ます。録音データはこまめにバックアップすることをお勧めします。自動でファイルサーバ等にムーブする処理を追加するといいかもしれません。  
  
なお、本イメージを使ったことによる一切の責任は当方にはありません。  
  

  
以上
  
