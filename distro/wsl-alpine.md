## WSL+Alpine Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) にAlpine Linuxをインストールし、それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  wsl用のAlpine Linuxの正式版はありませんので追加の操作が必要になります。　　

#  現在、執筆途中です。
    
![alp00](https://github.com/user-attachments/assets/31475bf5-3cb2-4ebc-ab88-7e6a1d42f3ed)

  
初版：2025/08/20  
改版：2025/08/20  

> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Alpine Linuxのターミナル時は、$   
>  
> とします。
> また、wslを実行しているPCを"ホストPC"、wsl下で実行しているAlpine Linuxを単に"Linux"とします。  

もし、すでにwslのインストールが済んでいる方は、`３．のAlpine Linuxのインストール`に飛んでください。 
  
  
## １．システム要件  
  
以下のコマンドによるインストールを行うには、  
Windows 10 バージョン 2004 以降 (ビルド 19041 以降) または Windows 11   
を実行している必要があります。  
以前のバージョンの場合は、 手動インストールを行ってください。    
  
また、Windows Updateでシステムを最新にしてください。  
最新でないと、インストールに失敗することがあります。  
システムを最新にするのが不安な方はインストールを中止してください。  
  
## ２．wslのインストール   
  
PowerShell(管理者)を起動し、以下のコマンドを実行します。( - は2個)  
```  
PS> wsl --update
PS> wsl --install  
```
  
![2](https://github.com/user-attachments/assets/0252b8a4-5579-4e74-9499-12ea1c9c37e3)  
  
一旦、Windowsを再起動してください。  
  
wslのインストールはこれで完了です。  
  
## ３．Alpine Linuxのインストール  
  
### 3.1 minirootfs  
  
以下よりminirootfsをダウンロードしてください。   
  
![alp02a](https://github.com/user-attachments/assets/677151ca-ff45-4e25-be6e-4515794dcec7)
  
![ALP04](https://github.com/user-attachments/assets/e4ec631c-012f-47d9-88c9-64764408801b)

alpine-minirootfs-3.22.1-x86.tar.gz (2025/08/20現在)    
がダウンロードされます。  

### 3.2 backup-alpine.zip  

backp-alpine.zipは、Alpine Linuxをカスタマイズし、rfriends3をインストールしたwslイメージです。  
以下よりダウンロードしてください。  
  
[backup-alpine.zip]()  
  
「安全でないダウンロードがブロックされました」と表示されるので  

  
「保存」をクイックしてください。  
  
![alp05](https://github.com/user-attachments/assets/e48ae00a-bc90-477b-9009-a7df92416e23)
  
ダウンロードが開始されます。  
  
![alp06](https://github.com/user-attachments/assets/461f4170-be93-49e1-ae73-d58e7ae70d5a)  
   
  
## ４．wslイメージのインストール  
  
ここでは仮にc:\wslを作業ディレクトリとします。  
c:\wsl ディレクトリを作成してください。  
  
### 4.1 インストール用ファイルの準備  
  
1) ダウンロードした2つのファイルを  
  alpine-minirootfs-3.22.1-x86.tar.gz  
  backup-alpine.zip  
  c:\wslにコピーしてください。
  
2) backup-alpine.zip をこの場所に解凍してください。  
  backup-alpine.tar  
  が解凍されます。  
  元のZIPファイルは不要です。  
   
### 4.2 インストール用ファイルの準備  
   
4) cccc


5) cccc


6) 

  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d ubuntu  

$ cd         <--- これを忘れないように！

$ sudo apt install -y git  (gitがすでにインストールされている場合は不要)
$ rm -rf rfriends3_core
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core
$ sed -i 's/^export optsamba="on"/export optsamba="off"/' install_ubuntu.sh
$ sh install_ubuntu.sh
```
  
### 5.2 インストール終了    
  
```
ip address is lo UNKNOWN 127.0.0.1/8 eth0 UP 172.19.148.3/20 .  
visit rfriends at http://xxx.xxx.xxx.xxx:8000  
finished  
```
finishedと表示されてインストールは完了です。表示されたIPアドレスをメモしてください。  
または、以下のコマンドでも確認できます。 
```
$ hostname -I
```
  
次に、ubuntuを終了し、shutdownします。  
  
```
$ exit

PS> wsl --shutdown  
```  
  
## ６．rfriends3の設定  
  
### 6.1 Alpine Linuxの実行  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d Alpine  
```  
  
### 6.2 rfriends3のWebサーバへのアクセス  
  
　5.2でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
![rfriends](https://github.com/user-attachments/assets/319f6021-6808-4b52-9660-7832d0980459)
  
### 6.3 チュートリアル
  
マニュアルのページのチュートリアルで基本的な操作を覚えてください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/)  

## ７．rfriendsのデータにアクセス
  
　Windowsのエクスプローラを開くと、左メニューにLinuxという項目があると思います。  
それをクリックすると、右にUbuntuというフォルダが表示されます。  
![linux](https://github.com/user-attachments/assets/c81abeb4-b497-4d27-8cb7-3ca60b33e9fa)

以下、Ubuntu¥home¥ユーザ名¥smbdir¥usr2 を辿っていけばrfriendsのデータにアクセスできます。   
![usr2](https://github.com/user-attachments/assets/8ad233a2-4ae7-438f-a558-477958e12b5a)


## ８．外部PCからのwebアクセス  
  
　同一LAN内の外部PCからrfriendsへのアクセスを行うための設定は以下のとおりです。通常は、この設定は行わないほうがいいと思います。  
  
　外部PCからWebアクセスするためには以下の2つの設定が必要になります。  

１）ホストPC -> Linux へのポートフォワーディングを設定する。  
```  
PS> netsh.exe interface portproxy add v4tov4 listenaddress=＜ホストPCのipアドレス＞listenport=8000 connectaddress=＜ubuntuのipアドレス＞ connectport=8000  
```

２）ホストPCのfirewallの設定で、ポート8000を開放する。  
  
　ホストPCで、コントロールパネルの "Windows Defender"  
  
を開きます。  
ポート8000を開放する規則をrfriendsという名前で設定する。  

```
詳細設定 - 受信の規則- 新しい規則 - ポート - 次へ
TCP
特定のローカルポート
8000
接続を許可する
プライベート,パブリック
rfriends
完了
```
  
３）外部PCから  
http://ホストPC:8000  
でrfriendsにアクセスできることを確認する。  

## ９．Linux+rfriends3の削除方法
  
　うまく動作しないとか、不要になった場合の削除方法です。 

```
Linuxからexitします。
$ exit

現在の状況を表示します。（Linuxが実行中）
PS> wsl -l -v
  NAME                   STATE           VERSION
* Alpine                 Running         2

Linuxをシャットダウンします。
$ wsl --shutdown  
  
ubuntuが停止中であることを確認します。
$ wsl -l -v  
  NAME                   STATE           VERSION  
* Alpine                 Stopped         2  
  
ubuntuの登録を解除します。  
$ wsl --unregister Alpine  
登録解除。  
この操作を正しく終了しました。  
```  
  
  
以上   


