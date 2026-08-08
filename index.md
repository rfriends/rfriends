<img width="400" alt="f0818127-0bac-4205-b3ca-d8a663e16557" src="https://github.com/user-attachments/assets/db0cbaa7-f9df-40ee-9125-cc54103e57f9" />
  
* rfriends3は、ラジコ、NHKらじるらじる、タイムフリー30、エリアフリー、聞き逃し、ゴガクを録音・再生できます。
* rfriends3は、ポッドキャスト（apple, lfr, nhk, jfn, radiko）を録音・再生できます。
* rfriends3は、OTTAVA、AFN GO、コミュニティFM（リスラジ[ListenRadio]、JCBA, FM++）を録音・再生できます。
* rfriends3は、Raspios, Windows, Linux, BSD, macOS, ChromeOS, docker, Termux, Volumio, MoodeAudio 等に対応。
  
* rfriends3は、操作がWEBサーバ（Lighttpd）経由で出来、とても簡単になっています。
* rfriends3は、PC,MAC,スマホ等WEBブラウザ(chrome,edge,firefox,safari等)が動作するものであれば、操作する端末はなんでも可能です。
* rfriends3は、sambaによるファイル共有、従来のsshによるcuiアクセスもできます。
       
<img width="400" alt="new_1" src="https://github.com/user-attachments/assets/3162bac3-88c5-46dc-a7ef-55b286f964bc" />

  
 * [お知らせ](info.md)  
 * [rfriendsに関するコメントはこちらに](comment.md)
 * [rfriendsを応援してください](donation.md)   
    
### １．rfriends3関連のリンク一覧    
 
|#|サイト|説明|
|--:|:--|:------|
|1|[アップデート情報](https://rfriends.github.io/rfriends/ver.html)|rfriends3のアップデート情報|  
|2|[マニュアル](https://rfriends.github.io/rfriends/manual/)|rfriends3のマニュアル|  
|3|[FAQ](https://rfriends.github.io/rfriends/manual/faq.html)|rfriends3に関するよくある質問|  
|4|[活用事例](https://rfriends.github.io/rfriends/tech/)|rfriends3をもっと便利にする活用事例|  
|5|[X(twitter）](https://x.com/rfriends2017)|リリース情報、障害情報、TIPSなど|
|6|[掲示板](https://ss1.xrea.com/rf3.s331.xrea.com/wforum/wforum.cgi)|質問、要望、感想など。|
|7|[ブログ](https://rfriends.hatenablog.com/)|hatenaブログでは詳細な技術情報|  
|8|[no+e](https://note.com/rfriends)|no+eではrfriends3関連の紹介記事|
|9|[レスキュー](https://rfriends.github.io/rfriends/manual/rescue.html)|rfriends3システムの起動不可等からの回復|
|10|[リンク](https://rfriends.github.io/rfriends/url.html)|関連WebSite 一覧|
  
### ２．rfriends3のインストール  
  
rfriends3はいろいろな機種に対応しています。  
下記の**OS部分**をクリックすれば各機種用インストール方法にジャンプできます。  　

|#  |機種        |OS|
|:--:|:------  | :-------------------------------------- |
| 1| Windows   |・[Windows](distro/windows.md)<br>・[WSL](distro/wsl.md)<br>・[WSL-Alpine](distro/wsl-alpine.md)<br>| 
| 2| mac     |・[macOS](distro/macos.md)<br>|
| 3| Linux     |・[Ubuntu / Mint / Zorin](distro/rfriends3_ubuntu.md)<br>・[Debian](distro/rfriends3_debian.md)<br>・[Stream / Rocky / Alma](distro/rfriends3_core2.md)<br>・[arch linux](distro/rfriends3_core3.md)<br>・[Alpine linux](distro/rfriends3_core4.md)<br>・[openSUSE](distro/rfriends3_core4.md)<br>・[slackware](distro/rfriends3_slackware.md)|
| 4| BSD     |・[FreeBSD](distro/rfriends3_core_bsd.md)<br>・[OpenBSD](distro/rfriends3_core_bsd.md)<br>・[NetBSD](distro/rfriends3_core_bsd.md)<br>|
| 5| コンテナ   |・[Docker(Linux,Windows,macOS)](distro/docker.md)<br>・[WSL Containers](distro/wslcontainers.md)<br>・[Apple Container](distro/applecontainer.md)<br>・[LXD/LXC](distro/lxd.md)|
| 6| ラズベリーパイ  |・[RaspberryPi -script-](distro/raspberrypi.md)<br>・[RaspberryPi -image-](distro/raspi_image.md)<br>・[DIetPi -script-](distro/dietpi.md)<br>・[DIetPi -image-](distro/dietpi_image.md)<br>・[Alpine -image-](distro/alpine_image.md)<br>・[Volumio](distro/volumio.md)<br>・[moode audio](distro/moode.md)| 
| 7| スマートフォン |・[Termux -script-](distro/termux.md)<br>・[Termux -image-](distro/termux_image.md)<br>・[UserLAnd](distro/userland.md)<br>・[android linux terminal](distro/rfriends3_core.md)|
| 8| Chromebook  |・[Linux開発環境](distro/chromeos.md)| 
| 9| iPhone / iPad |・[iSH Shell](distro/ios.md)| 
| 10| 仮想（qemu）   |・[Windows](distro/win_qemu.md)<br>・[Linux](distro/linux_qemu.md)<br>・[macOS](distro/macos_qemu.md)|
| 11| 仮想 |・[vmware-alpine](distro/vmware-alpine.md)| 

   
> [!NOTE]
> WebサーバはLighttpdが標準ですが、非サポートの場合はビルトインサーバになります。  
> 仮想環境の場合、sambaはポート転送設定が必要になります。
  
### ３．rfriends3スクリーンショット  
  
<img width="600"  alt="clip_5" src="https://github.com/user-attachments/assets/7e479ad1-8511-4b9d-a9ac-0ef8934cfd12" />

  
![play](https://github.com/user-attachments/assets/8bf5cdd9-9702-412b-8165-8cbab928941a)
  
![cli](https://github.com/user-attachments/assets/3e0df727-f70d-4e05-82b2-2b502c56b993)
  
![gallery](https://github.com/user-attachments/assets/fed28352-0636-472e-9015-51abea05e17a)  
  
初版：2023/07/12  
改版：2025/08/30  
  

    

ラジオ録音 radiko ラジコ タイムフリー エリアフリー らじるらじる 聞き逃し ゴガク  ポッドキャスト Windows Linux macOS RaspberrypiOS ChromeOS Termux Volumio MoodeAudio docker
