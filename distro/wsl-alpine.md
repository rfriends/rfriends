## WSL+Alpine Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) にAlpine Linuxをインストールし、それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  すでにrfriends3もインストール、設定済なのでイメージをインポートするだけで簡単に使用開始できます。  　　

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
  
## ３．wsl(alpine)版rfriends3のインストール  
  
### 3.1 backup-alpine.zipをダウンロード  

backp-alpine.zipは、Alpine Linuxをカスタマイズし、rfriends3をインストールしたwslイメージです。  
以下よりダウンロードしてください。  
  
[backup-alpine.zip]()  
  
「安全でないダウンロードがブロックされました」と表示されるので  

  
「保存」をクイックしてください。  
  
![alp05](https://github.com/user-attachments/assets/e48ae00a-bc90-477b-9009-a7df92416e23)
  
ダウンロードが開始されます。  

![alp06](https://github.com/user-attachments/assets/af99782f-3206-4afa-93bd-08d15bf59ead)  
  
### 3.2backup-alpine.zipを解凍   
  
1) ここでは仮にc:\wslを作業ディレクトリとします。  
c:\wsl ディレクトリを作成してください。
  
2) backup-alpine.zip をダブルクリックしてください。  
  backup-alpine.tar  
  が表示されるので、このファイルをc:\wslにコピーしてください。

## ４．wslイメージ(backup-alpine.tar)のインストール  
  
PowerShellを起動し、以下のコマンドを実行します。( - は2個)  
  
```    
PS> cd c:\wsl
PS> wsl --import Alpine alpine backup-alpine.tar  
```
  
## ５．wslイメージ(backup-alpine.tar)の起動
  
PowerShellを起動し、以下のコマンドでAlpineにログインします。   
```
PS> wsl -d Alpine
```
  

以下のコマンドでIPアドレスを確認してください。  
  
```  
$ ip a | grep eth0  
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000  
    inet 172.31.205.45/20 brd 172.31.207.255 scope global eth0  
```  

この場合、IPアドレスは`12.31.205.45`です。  
これをメモしてください。  
  
すでに、rfriends3は動作しています。  
  
## ６．rfriends3 
  
### 6.1 rfriends3にアクセス  
  
　５．でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
12.31.205.45:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
![rfriends](https://github.com/user-attachments/assets/319f6021-6808-4b52-9660-7832d0980459)
  
### 6.2 チュートリアル
  
マニュアルのページのチュートリアルで基本的な操作を覚えてください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/)  

## ７．rfriendsのデータにアクセス
  
　Windowsのエクスプローラを開くと、左メニューにLinuxという項目があると思います。  
それをクリックすると、右にAlpineというフォルダが表示されます。  
![linux](https://github.com/user-attachments/assets/c81abeb4-b497-4d27-8cb7-3ca60b33e9fa)

以下、Alpine¥home¥alpine名¥smbdir¥usr2 を辿っていけばrfriendsのデータにアクセスできます。   
![usr2](https://github.com/user-attachments/assets/8ad233a2-4ae7-438f-a558-477958e12b5a)

> [!NOTE]
> sambaも動作中なので、エクスプローラに
> \\12.31.205.45  
> と入力してもアクセスできます。
> こちらのほうが簡単かもしれません。  
  
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
「７．rfriendsのデータにアクセス」を参考に必要なデータは保存しておいてください。  
  
Linuxからexitします。  
  
```  
$ exit    
```  
  
PowerShellを起動し、現在の状況を表示します。（Linuxが実行中）  
  
```  
PS> wsl -l -v
  NAME                   STATE           VERSION
* Alpine                 Running         2
```
  
Linuxをシャットダウンし、登録を解除します。　　
Linux、rfriends、録音したデータ等すべて消えます。  

  
```  
PS> wsl -t Alpine
PS> wsl --unregister Alpine  
  
登録解除。  
この操作を正しく終了しました。  
```
  
## １０．補足
      
初期パスワードは以下のとおりです。  
セキュリティ上、変更してください。   
    
```  
ルートユーザ　root/root  
実行ユーザ　alpine/alpine  
```
    
1) Alpineにログイン  
    
```  
PS> wsl -d Alpine  
Entering /sbin/init PID: 9  
$  
```
  
2) 実行ユーザalpineのパスワード変更  
  
```
$ passwd  
Changing password for alpine  
Old password:  
New password:  
Retype password:  
passwd: password for alpine changed by alpine
$  
```  
  
3) ルートユーザのパスワード変更  
  
```  
$ sudo -i  
[sudo] password for alpine:  
# passwd  
Changing password for root  
New password:  
Retype password:  
passwd: password for root changed by root  
# exit  
$   
```   

4) Alpineからログアウト
  
```
$ exit
PS>    
$   
```

  
以上   


