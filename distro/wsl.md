## WSL+Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) では簡単にUbuntu等のLinuxが利用できます。それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2024/11/15  
改版：2026/08/12  

> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Linuxのターミナル時は、$   
>  
> とします。
> また、wslを実行しているPCを"ホストPC"、wsl下で実行しているLinuxを単に"Linux"とします。
  
## １．wslのインストール  
  
もし、すでにwsl,linuxのインストールが済んでいる方は、この項は不要です。  　 
  
wslのインストール方法については、  
  
[wslのインストール](wsl_install.md)  
  
## ２．rfriends3のインストール  
  
### 2.1 インストール  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d Ubuntu  

$ cd         <--- これを忘れないように！

$ sudo apt update && sudo apt upgrade -y  
[sudo: authenticate] Password: パスワード
  
$ sudo apt install -y git  (gitがすでにインストールされている場合は不要)
$ rm -rf rfriends3_core
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core
  
samba をOFFにする。
  
$ sed -i 's/^export optsamba="on"/export optsamba="off"/' install_ubuntu.sh
または
$ nano install_ubuntu.sh
export optsamba="off"

$ sh install_ubuntu.sh
```
ubuntu 26.04, debian 13の場合、以下が必要です。
```
$ cd
$ cd rfriends3_core
$ sh lighttpd_override.sh
```
  
### 2.2 インストール終了    
  
```
ip address is lo UNKNOWN 127.0.0.1/8 eth0 UP 172.19.148.3/20 .  
visit rfriends at http://xxx.xxx.xxx.xxx:8000  
finished  
```
finishedと表示されてインストールは完了です。  
いくつかのエラーが表示されますが、インストールの共通化によるものです。  
  
表示されたIPアドレスをメモしてください。  
または、以下のコマンドでも確認できます。 
```
$ hostname -I
```
  
次に、ubuntuを終了し、shutdownします。  
  
```
$ exit

PS> wsl --shutdown  
```  
  
## ３．rfriends3の設定  
  
### 3.1 Ubuntuの実行  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d Ubuntu  
```  
  
### 3.2 rfriends3のWebサーバへのアクセス  
  
　4.2でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
![rfriends](https://github.com/user-attachments/assets/319f6021-6808-4b52-9660-7832d0980459)
  
### 3.3 チュートリアル
  
マニュアルのページのチュートリアルで基本的な操作を覚えてください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/)  

## ４．rfriendsのデータにアクセス
  
　Windowsのエクスプローラを開くと、左メニューにLinuxという項目があると思います。  
それをクリックすると、右にUbuntuというフォルダが表示されます。  
![linux](https://github.com/user-attachments/assets/c81abeb4-b497-4d27-8cb7-3ca60b33e9fa)

以下、Ubuntu¥home¥ユーザ名¥rfriends3¥usr を辿っていけばrfriendsのデータにアクセスできます。   
![usr2](https://github.com/user-attachments/assets/8ad233a2-4ae7-438f-a558-477958e12b5a)


## ５．外部PCからのwebアクセス  
  
　同一LAN内の外部PCからrfriendsへのアクセスを行うための設定は以下のとおりです。通常は、この設定は行わないほうがいいと思います。  
  
　外部PCからWebアクセスするためには以下の2つの設定が必要になります。  

１）ホストPC -> Ubuntu へのポートフォワーディングを設定する。  
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

## ６．ubuntu+rfriends3の削除方法
  
　うまく動作しないとか、不要になった場合の削除方法です。 

```
ubuntuからexitします。
$ exit

現在の状況を表示します。（ubuntuが実行中）
PS> wsl -l -v
  NAME                   STATE           VERSION
* Ubuntu                 Running         2

ubuntuをシャットダウンします。
$ wsl --shutdown

ubuntuが停止中であることを確認します。
$ wsl -l -v
  NAME                   STATE           VERSION
* Ubuntu                 Stopped         2

ubuntuの登録を解除します。
$ wsl --unregister ubuntu
登録解除。
この操作を正しく終了しました。
```

  
以上  


