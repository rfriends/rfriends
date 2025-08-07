##  ラジオ録音アプリ「rfriends3」はラジオ好きのためのプログラムです。  
    
* rfriends3は、ラジコ、らじるらじる、ポッドキャストを録音できます。  
* rfriends3は、操作がWEBサーバ（Lighttpd）経由で出来、とても簡単になっています。
* rfriends3は、PC,MAC,スマホ等WEBブラウザ(chrome,edge,firefox,safari等)が動作するものであれば、操作する端末はなんでも可能です。
* rfriends3は、sambaによるファイル共有、従来のsshによるcuiアクセスもできます。
* rfriends3は、radiko ラジコ タイムフリー エリアフリー らじるらじる 聞き逃し ゴガク  ポッドキャスト Windows Linux macOS RaspberrypiOS ChromeOS Termux Volumio MoodeAudio に対応しています。  
     
![20240806170114](https://github.com/user-attachments/assets/2c40c57d-7ae4-4eee-811e-cb6c28f112f0)   
  
### １．rfriends3関連のリンク一覧    
 
|#|サイト|説明|
|--:|:--|:------|
|1|[アップデート情報](https://rfriends.github.io/rfriends/ver.html)|rfriends3のアップデート情報|  
|2|[マニュアル](https://rfriends.github.io/rfriends/manual/)|rfriends3のマニュアル|  
|3|[活用事例](https://rfriends.github.io/rfriends/tech/)|rfriends3をもっと便利にする活用事例|  
|4|[X(twitter）](https://x.com/rfriends2017)|リリース情報、障害情報、TIPSなど|
|5|[掲示板](http://www.rf3.shop/wforum/wforum.cgi)|質問、要望、感想など|
|6|[ブログ](https://rfriends.hatenablog.com/)|hatenaブログでは詳細な技術情報|  
|7|[レスキュー](https://rfriends.github.io/rfriends/manual/rescue.html)|rfriends3システムの起動不可等からの回復|

 ・[rfriendsを応援してください](donation.md)  
  
### ２．rfriends3のインストール  
  
rfriends3はいろいろな機種に対応しています。  
下記の**OS部分**をクリックすれば各機種用インストール方法にジャンプできます。  　

|#  |機種        |OS|
|:--:|:------  | :-------------------------------------- |
| 1| Windows   |・[Windows](distro/windows.md)<br>・[WSL](distro/wsl.md)<br>・[Docker Desktop](distro/docker.md)| 
| 2| mac     |・[macOS](distro/macos.md)<br>・[Docker Desktop](distro/docker.md)|
| 3| Linux/BSD     |・[Ubuntu / Debian](distro/rfriends3_core.md)<br>・[Stream / Rocky / Alma](distro/rfriends3_core.md)<br>・[FreeBSD](distro/rfriends3_core.md)<br>・[Alpine linux](distro/rfriends3_core.md)<br>・[openSUSE](distro/rfriends3_core.md)<br>・[arch linux](distro/rfriends3_core.md)|
| 4| コンテナ   |・[Docker](distro/docker.md)<br>・[LXD/LXC](distro/lxd.md)|
| 5| ラズベリーパイ  |・[RaspberryPi -script-](distro/raspberrypi.md)<br>・[RaspberryPi -image-](distro/raspi_image.md)<br>・[Volumio](distro/volumio.md)<br>・[moode audio](distro/moode.md)| 
| 6| スマートフォン |・[Termux](distro/termux.md)<br>・[UserLAnd](distro/userland.md)<br>・[android linux terminal](distro/rfriends3_core.md)|
| 7| Chromebook  |・[Linux開発環境](distro/chromeos.md)| 
| 8| iPhone / iPad |・[iSH Shell(テスト中)](distro/ios.md)| 

   
> [!NOTE]
> WebサーバはLighttpdが標準ですが、非サポートの場合はビルトインサーバになります。  
> 仮想環境の場合、sambaはポート転送設定が必要になります。  
  
### ３．rfriends3スクリーンショット  
  
![top](https://github.com/user-attachments/assets/5d621f57-425f-4fcd-9448-a816ededd8dc)
  
![play](https://github.com/user-attachments/assets/8bf5cdd9-9702-412b-8165-8cbab928941a)
  
![cli](https://github.com/user-attachments/assets/3e0df727-f70d-4e05-82b2-2b502c56b993)
  
![gallery](https://github.com/user-attachments/assets/fed28352-0636-472e-9015-51abea05e17a)  
  
初版：2023/07/12  
改版：2025/08/07  
  
  

ラジオ録音 radiko ラジコ タイムフリー エリアフリー らじるらじる 聞き逃し ゴガク  ポッドキャスト Windows Linux macOS RaspberrypiOS ChromeOS Termux Volumio MoodeAudio docker

