## rfriendsはラジオ好きのためのプログラムです。  
  
* rfriends3はラジコ、らじるらじる、ポッドキャストを録音できます。  
* rfriends3は操作がWEBサーバ（Lighttpd）経由で出来、とても簡単になっています。
* 操作する端末はPC,MAC,スマホ等WEBブラウザ(chrome,edge,firefox,safari等)が動作するものであればなんでも可能です。
* 従来のsshによるcuiアクセスもできます。a
* rfriends3はradiko ラジコ タイムフリー エリアフリー らじるらじる 聞き逃し ゴガク  ポッドキャスト Windows Linux macOS RaspberrypiOS ChromeOS Termux Volumio MoodeAudio に対応しています。  
  
![20240806170114](https://github.com/user-attachments/assets/2c40c57d-7ae4-4eee-811e-cb6c28f112f0)   
  
OS(詳細)部分をクリックすれば各機種用インストール方法にジャンプできます。  　

|#  |OS        |OS(詳細)| Lighttpd|samba|ポート転送|
|:--:|:------  | :-------------------------------------- |:--:|:--:|:--:| 
| 1| Windows   |[Windows][rfriends_windows]<br>[WSL+Ubuntu][rfriends_wsl]|-<br>〇|〇<br>△|-<br>△| 
| 2| macOS     |[macOS][rfriends_macos]|△|-|-|
| 3| Linux     |[**Ubuntu/debian**][rfriends3_core]<br>[Stream 9/Rocky][rfriends3_core]<br>[arch][rfriends3_core]|〇<br>〇<br>〇|〇<br>〇<br>〇|-<br>-<br>-|  
| 4| RaspiOS   |[**RaspberryPi**][rfriends_raspberrypi]<br>[Volumio][rfriends_volumio]<br>[MoOde Player][rfriends_moode]|〇<br>〇<br>〇|〇<br>〇<br>〇|-<br>-<br>-| 
| 5| ChromeOS  |[**Linux開発環境**][rfriends_chromeos]|〇|△|〇|
| 6| androidOS |[**Termux**][rfriends_termux]<br>[UserLAnd][rfriends_userland]|〇<br>〇|△<br>△|△<br>△|  
| 7| iOS       |なし|||| 
| 8| コンテナ   |[LXD][rfriends_lxd]<br>[**Docker**][rfriends_docker]|〇<br>〇|△<br>△|△<br>〇|  

  > [!NOTE]
> Lighttpdが非サポートの場合はビルトインサーバになります。  
> sambaが△の場合はポート転送が必要になります。  
> ポート転送設定は〇のものが簡単です。
  
[rfriends_windows]:distro/windows.html
[rfriends_wsl]:distro/wsl.html
[rfriends_macos]:distro/macos.html
[rfriends3_core]:distro/rfriends3_core
[rfriends_ubuntu]:distro/rfriends_ubuntu
[rfriends_stream9]:distro/rfriends_stream9
[rfriends_arch]:distro/rfriends_arch
[rfriends_raspberrypi]:distro/rfriends_raspberrypi
[rfriends_volumio]:distro/rfriends_volmio
[rfriends_moode]:distro/rfriends_moode
[rfriends_chromeos]:distro/rfriends_chromeos
[rfriends_termux]:distro/rfriends_termux
[rfriends_userland]distro/rfriends_userland
[rfriends_lxd]:distro/rfriends_lxd
[rfriends_docker]:distro/rfriends_docker

  
## rfriends3関連のリンク一覧    
  
|リンク|詳細|
|---|---|
|[マニュアル](manual/)|rfriends3のマニュアル|
|[チュートリアル](manual/tutorial.md)|rfriends3の基本的な使い方|
|[活用事例](https://rfriends.hatenablog.com/entry/2024/08/14/113233)|rfriends3をもっと便利にする活用事例|
|[X(twitter)](https://twitter.com/rfriends2017)|リリース情報、障害情報、TIPS等を発信|
|[ブログ](https://rfriends.hatenablog.com/)|詳細な技術情報を発信|
|[掲示板](http://ceres.s501.xrea.com/wforum/wforum.cgi)|質問、要望、感想など|
|[レスキュー](manual/rescue.md)|rfriends3システムの起動不可等からの回復|  

  
## rfriends3スクリーンショット  
  
![top](https://github.com/user-attachments/assets/5d621f57-425f-4fcd-9448-a816ededd8dc)
  
![play](https://github.com/user-attachments/assets/8bf5cdd9-9702-412b-8165-8cbab928941a)
  
![cli](https://github.com/user-attachments/assets/3e0df727-f70d-4e05-82b2-2b502c56b993)
  
![gallery](https://github.com/user-attachments/assets/fed28352-0636-472e-9015-51abea05e17a)
  
  
初版：2023/07/12  
改版：2025/01/27  
  
