### ラジオ好きのために  
  
* rfriends3はラジコ、らじるらじる、ポッドキャストを録音できます。  
* rfriends3は操作がWEBサーバ（Lighttpd）経由で出来、とても簡単になっています。
* 操作する端末はPC,MAC,スマホ等WEBブラウザ(chrome,edge,firefox,safari等)が動作するものであればなんでも可能です。
* 従来のsshによるcuiアクセスもできます。a
* rfriends3は radiko ラジコ タイムフリー エリアフリー らじるらじる 聞き逃し ゴガク ポッドキャスト に対応しています。
* rfriends3は Windows Linux macOS Raspberrypi ChromeOS Termux Volumio MoodeAudio LXD docker に対応しています。  
  
![20240806170114](https://github.com/user-attachments/assets/2c40c57d-7ae4-4eee-811e-cb6c28f112f0)   
  
初版：2023/07/12  
改版：2025/01/30  
  
### １．rfriends3関連のリンク一覧    
  
|リンク|詳細|  
|---|---|  
|[マニュアル](manual/index.html)|rfriends3のマニュアル|  
|[活用事例](https://rfriends.hatenablog.com/entry/2024/08/14/113233)|rfriends3をもっと便利にする活用事例|  
|[X(twitter)](https://twitter.com/rfriends2017)|リリース情報、障害情報、TIPS等を発信|  
|[ブログ](https://rfriends.hatenablog.com/)|詳細な技術情報を発信|  
|[掲示板](http://ceres.s501.xrea.com/wforum/wforum.cgi)|質問、要望、感想など|  
|[レスキュー](manual/rescue.html)|rfriends3システムの起動不可等からの回復|  
  
### ２．インストール  
  
OS(詳細)部分をクリックすれば各機種用インストール方法にジャンプできます。  　

|#  |OS        |OS(詳細)| Lighttpd|samba|
|:--:|:------  | :-------------------------------------- |:--:|:--:| 
| 1| Windows   |[Windows](distro/windows.md)<br>[WSL+Ubuntu](distro/wsl.md)|-<br>〇|〇<br>△| 
| 2| macOS     |[macOS](distro/macos.md)|△|-|
| 3| Linux     |[**Ubuntu/debian**](distro/rfriends3_core.md)<br>[Stream 9/Rocky](distro/rfriends3_core.md)<br>[arch](distro/rfriends3_core.md)|〇<br>〇<br>〇|〇<br>〇<br>〇|  
| 4| RaspiOS   |[**RaspberryPi -script-**](distro/raspberrypi.md)<br>[Volumio](distro/volumio.md)<br>[MoOde Player](distro/moode.md)|〇<br>〇<br>〇|〇<br>〇<br>〇|  
| 5| RaspiOS   |[RaspberryPi -image-](distro/raspi_image.md)|〇|〇|  
| 6| ChromeOS  |[**Linux開発環境**](distro/chromeos.md)|〇|△|  
| 7| androidOS |[**Termux**](distro/termux.md)<br>[UserLAnd](distro/userland.md)|〇<br>〇|△<br>△|  
| 8| iOS       |なし|-|-| 
| 9| コンテナ   |[LXD](distro/lxd.md)<br>[**Docker**](distro/docker.md)|〇<br>〇|△<br>△|  
  
> [!NOTE]
> Lighttpdが非サポートの場合はビルトインサーバになります。  
> sambaが△の場合はポート転送が必要になります。  
  
### ３．rfriends3スクリーンショット  
  
![top](https://github.com/user-attachments/assets/5d621f57-425f-4fcd-9448-a816ededd8dc)
  
![play](https://github.com/user-attachments/assets/8bf5cdd9-9702-412b-8165-8cbab928941a)
  
![cli](https://github.com/user-attachments/assets/3e0df727-f70d-4e05-82b2-2b502c56b993)
  
![gallery](https://github.com/user-attachments/assets/fed28352-0636-472e-9015-51abea05e17a)
  
  

  
