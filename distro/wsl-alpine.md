## WSL+Alpine Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) にAlpine Linuxをインストールし、それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  

#  現在、執筆途中です。
    
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2025/08/20  
改版：2025/08/20  

> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Alpine Linuxのターミナル時は、$   
>  
> とします。
> また、wslを実行しているPCを"ホストPC"、wsl下で実行しているAlpine Linuxを単に"Linux"とします。  

もし、すでにwslのインストールが済んでいる方は、４．のAlpine Linuxのインストールに飛んでください。 
  

注１）以下の操作が必要です。  
```
$ sudo vi /etc/wsl.conf
[boot]
systemd=true

$ exit
PS> wsl --shutdown
PS> wsl -d ディストリビューション
```
  
## １．システム要件  
```  
AI による概要  
  
WSL2 (Windows Subsystem for Linux 2) を使用するには、
Windows 10 (x64) バージョン 1903 以降 (ビルド 18362.1049+) または Windows 11 が必要です。  
また、64ビットのプロセッサ、4GB以上のRAM、そして仮想マシンプラットフォーム機能が有効化されている必要があります。﻿    
```  
## ２．準備  
  
１）PCのbiosで仮想化を有効にする。  
```
AI による概要

PCのBIOSで仮想化を有効にするには、次の手順に従います。  
電源をオンにして、BIOSを起動します。  
BIOSで「セキュリティ」タブを選択します。  
「仮想化テクノロジ（VTx）」や「Intel VTT」、「Intel VT-d」などの設定項目を探し、有効にします。  
設定を保存して、システムを再起動します。  
仮想化機能を有効にするには、お使いのCPUが仮想化技術に対応している必要があります。  
また、一部のBIOSでは搭載CPUが仮想化技術に対応していない場合、設定項目が表示されない場合があります。  
仮想化が有効になっているかどうかを確認するには、  
Ctrl + Alt + Del キーを同時に押してタスクマネージャーを起動し、  
｢パフォーマンス｣タブ内の｢仮想化｣を確認します。  
```  
２）Windows Updateでシステムを最新にする。  
　最新でないと、インストールに失敗することがあります。  
　システムを最新にするのが不安な方はインストールを中止してください。  
  
## ３．wslのインストール   
  
PowerShell(管理者)を起動し、以下のコマンドを実行します。( - は2個)  
```  
PS> wsl --update
PS> wsl --install  
```
  
![2](https://github.com/user-attachments/assets/0252b8a4-5579-4e74-9499-12ea1c9c37e3)  
  
一旦、Windowsを再起動してください。  
  
wslのインストールはこれで完了です。  
  
### ４．Alpine Linuxのインストール  

 
ユーザの作成とパスワードを要求されます。  

  
Alpine Linuxのインストールはこれで完了です。  
  
## ５．rfriends3のインストール  
  
### 5.1 インストール  
  
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


