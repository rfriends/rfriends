# Alpine Linuxで作るVmware版rfriends3  
  
  
Alpine Linux(3.22.1)のStandard版にrfriends3をインストールしたものです。  
非常に軽量なものができました。    
  
2025/08/18 new  
2025/09/17 add sound  
  

  
## １，前提条件  
  
・PCにVmware Player(WorkstationProでも可)をインストールしてください。  
　ver.は17.5 以上。  
   
> [!CAUTION]  
> 現在、vmwareはダウンロード先を見つけるのが非常に大変です。  
> 今回はここが一番の難関かもしれません。  
>   
> 以下のところが非常に参考になります。  
> [無償化された「VMware Workstation Pro」はダウンロードが超難関に？](https://forest.watch.impress.co.jp/docs/review/2002377.html)  
   
## ２．ダウンロード  
  
・今回作成した仮想イメージをダウンロードしてください。    
  右クリックしてリンク先を保存です。ブロックされた場合は、「保存」を押してください。  
    
  
[vmware-rfriends3-alpine.zip](http://rf3.s331.xrea.com/storage/vmware-rfriends3-alpine.zip) （約 530MB）  
  
## ３．解凍  
  
・ダウンロードしたZIPファイルを解凍し、ディレクトリごと適当な場所にコピーしてください。  
　ディレクトリ(vmware-rfriends3-alpine)の中には以下の2つのファイルがあります。  
  
```  
alpine.vmx  
alpine.vmdk  
```  
  
## ４．実行  
  
### 4.1 ファイルを選択  
  
  vmware - ファイル - 開くでディレクトリの中のalpine.vmxを選択して下さい。  
　alpine linuxが起動します。（味気ない真っ黒な画面ですね）  
   
 ![al01](https://github.com/user-attachments/assets/1faf806f-c93c-45f0-bbcf-a0b9dc8c605a)  
  
### 4.2 ログイン  
  
  ・alpine/alpine でログインしてください。  
  
> [!NOTE]  
> rootのパスワードはrootです。
    
### 4.3 IPアドレス  
  
以下のコマンドを入力してIPアドレスを調べてください。  
ここでは、192.168.1.151となっていますが環境により異なります。  
  
```  
$ ip a | grep inet  
inet 192.168.1.151/24 scope global eth0  
```  
これで、この画面はほぼさわる必要がありません。  
`exit`  
でログアウトしても構いません。 
  
> [!NOTE]  
> ちなみに終了は、`sudo poweroff`です。
> power offすると、当然ですが、rfriends3も終了します。
    
  
### 4.4 rfriends3にアクセス  
  
Webブラウザに  
`192.168.1.151:8000`  
と入力してください。  
下記のような画面になったら成功です。  
  
![al02](https://github.com/user-attachments/assets/bbe46385-cf3e-44b0-84a1-860942c9c6cc)  
  
## ５．操作  
  
・操作に関しては、マニュアルを参照してください。  
  
[rfriends3](https://rfriends.github.io/rfriends/)  
  
## ６．その他  
  
### 6.1 サウンド  
  
通常はホストのサウンドカードから音が出ますが、新たにサウンドデバイスを追加した場合、  
以下のような出力がされます。（例ではUSB audioを追加しています。）
```
$ cat /proc/asound/pcm
00-00: ES1371/1 : ES1371 DAC2/ADC : playback 1 : captu
00-01: ES1371/2 : ES1371 DAC1 : playback 1
01-00: USB Audio : USB Audio : playback 1 : capture 1
```
この例ではcardの番号は1ですので、以下を追加してください。  
```  
$ vi  ~/.asoundrc  
pcm.!default {  
type hw  
card 1  
}  
ctl.!default {  
type hw  
card 1  
}   
```   
rfriendsの聴取（サーバ）の音はCARD 1から出力されるようになります。  
  
以上  
  
