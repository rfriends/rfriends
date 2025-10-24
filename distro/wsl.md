## WSL+Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) では簡単にUbuntu等のLinuxが利用できます。それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2024/11/15  
改版：2025/10/23

> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Linuxのターミナル時は、$   
>  
> とします。
> また、wslを実行しているPCを"ホストPC"、wsl下で実行しているLinuxを単に"Linux"とします。  

もし、すでにwsl,linuxのインストールが済んでいる方は、４．のrfriendsのインストールに飛んでください。 
  

### 動作確認済ディストリビューション　(2025/10/23現在)  
  
ディストリビューションはアクセスしたときにより異なります。  
  
それぞれのrfriendsのインストール方法は以下を参照してください。  
[Linux版rfriends3でラジオ録音](https://rfriends.github.io/rfriends/distro/rfriends3_core.html)
  
|最終確認|判定|ディストリビューション|sh|備考|   
|---|:---:|---|---|---|  
|2025/05/02|〇|Ubuntu &nbsp;&nbsp;&nbsp;&nbsp;(24.04)|ubuntu||   
|2025/05/02|〇|Ubuntu-20.04|ubuntu||  
|2025/05/02|〇|Ubuntu-22.04|ubuntu|| 
|2025/05/02|〇|Ubuntu-24.04|ubuntu|| 
|2025/10/23|〇|Debian &nbsp;&nbsp;&nbsp;&nbsp;(13.1)|debian|install_debian_apache.sh|  
|2025/05/02|〇|kali-linux|debian||  
|2025/05/02|〇|FedoraLinux-42|stream||  
|2025/05/02|✕|OracleLinux_7_9|stream|yum<br>注１）|   
|||OracleLinux_8_10|stream||  
|||OracleLinux_9_5|stream||  
|2025/05/02|〇|AlmaLinux-8|stream||  
|2025/05/02|〇|AlmaLinux-9|stream||  
|||AlmaLinux-10|stream||  
|2025/05/02|〇|AlmaLinux-Kitten-10|stream||   
|2025/05/03|✕|SUSE-Linux-Enterprise-15-SP6|suse|lighttpd<br>not found|  
|||SUSE-Linux-Enterprise-15-SP7|suse||  
|2025/05/02|〇|openSUSE-Tumbleweed|suse||  
|2025/05/02|〇|openSUSE-Leap-15.6|suse||   
|||openSUSE-Leap-16.0|suse||  
|2025/05/02|〇|archlinux|arch||  

### 提供停止　(2025/10/23現在)  
  
動作確認しましたが、提供されなくなったものです。  
  
|最終確認|判定|ディストリビューション|sh|備考|   
|---|:---:|---|---|---|  
|2025/05/02|〇|Ubuntu-18.04|ubuntu||  
|2025/05/02|〇|Debian &nbsp;&nbsp;&nbsp;&nbsp;(12)|debian||   
|2025/05/02|〇|OracleLinux_8_7|stream|注１）|  
|2025/05/02|〇|OracleLinux_9_1|stream|注１）|  
|2025/05/03|✕|SUSE-Linux-Enterprise-15-SP5|suse|lighttpd<br>not found| 

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
  
WSL2 (Windows Subsystem for Linux 2) を使用するには、Windows 10 (x64) バージョン 1903 以降 (ビルド 18362.1049+) または Windows 11 が必要です。
また、64ビットのプロセッサ、4GB以上のRAM、そして仮想マシンプラットフォーム機能が有効化されている必要があります。﻿    
```  
## ２．準備  
  
１）PCのbiosで仮想化を有効にする。  
```
AI による概要

PCのBIOSで仮想化を有効にするには、次の手順に従います。
電源をオンにして、BIOSを起動します。?
BIOSで「セキュリティ」タブを選択します。?
「仮想化テクノロジ（VTx）」や「Intel VTT」、「Intel VT-d」などの設定項目を探し、有効にします。?
設定を保存して、システムを再起動します。?
仮想化機能を有効にするには、お使いのCPUが仮想化技術に対応している必要があります。
また、一部のBIOSでは搭載CPUが仮想化技術に対応していない場合、設定項目が表示されない場合があります。?
仮想化が有効になっているかどうかを確認するには、
Ctrl + Alt + Del キーを同時に押してタスクマネージャーを起動し、
｢パフォーマンス｣タブ内の｢仮想化｣を確認します。
```  
２）Windows Updateでシステムを最新にする。  
　最新でないと、インストールに失敗することがあります。  
　システムを最新にするのが不安な方はインストールを中止してください。  
  
## ３．wslとLinuxのインストール  
  
### 3.1 wslのインストール  
  
PowerShell(管理者)を起動し、以下のコマンドを実行します。( - は2個)  
```  
PS> wsl --update
PS> wsl --install  
```
  
![2](https://github.com/user-attachments/assets/0252b8a4-5579-4e74-9499-12ea1c9c37e3)  
  
一旦、Windowsを再起動してください。  
  
### 3.2 Linuxのインストール  

```
PS> wsl --list --online
インストールできる有効なディストリビューションの一覧を次に示します。
'wsl.exe --install <Distro>' を使用してインストールします。
```
ここではubuntuをインストールします。  
debianでもほぼ同じやり方でインストールできます。  
PowerShellを起動し、以下のコマンドを実行します。  
```
PS> wsl --install ubuntu
ダウンロード中: Ubuntu
インストール中: Ubuntu
ディストリビューションが正常にインストールされました。'wsl.exe -d Ubuntu' を使用して起動できます
```
ubuntuを起動します。  
ユーザの作成とパスワードを要求されます。  
```
PS> wsl -d ubuntu
Provisioning the new WSL instance Ubuntu
This might take a while...
Create a default Unix user account: ユーザ名
New password: パスワード
Retype new password: パスワード
passwd: password updated successfully
```
  
WSLとUbuntuのインストールはこれで完了です。  
  
## ４．rfriends3のインストール  
  
### 4.1 インストール  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d ubuntu  

$ cd         <--- これを忘れないように！

$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt install -y git  (gitがすでにインストールされている場合は不要)
$ rm -rf rfriends3_core
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core
$ sed -i 's/^export optsamba="on"/export optsamba="off"/' install_ubuntu.sh
$ sh install_ubuntu.sh
```
  
### 4.2 インストール終了    
  
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
  
## ５．rfriends3の設定  
  
### 5.1 Ubuntuの実行  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d ubuntu  
```  
  
### 5.2 rfriends3のWebサーバへのアクセス  
  
　4.2でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
![rfriends](https://github.com/user-attachments/assets/319f6021-6808-4b52-9660-7832d0980459)
  
### 5.3 チュートリアル
  
マニュアルのページのチュートリアルで基本的な操作を覚えてください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/)  

## ６．rfriendsのデータにアクセス
  
　Windowsのエクスプローラを開くと、左メニューにLinuxという項目があると思います。  
それをクリックすると、右にUbuntuというフォルダが表示されます。  
![linux](https://github.com/user-attachments/assets/c81abeb4-b497-4d27-8cb7-3ca60b33e9fa)

以下、Ubuntu¥home¥ユーザ名¥smbdir¥usr2 を辿っていけばrfriendsのデータにアクセスできます。   
![usr2](https://github.com/user-attachments/assets/8ad233a2-4ae7-438f-a558-477958e12b5a)


## ７．外部PCからのwebアクセス  
  
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

## ８．ubuntu+rfriends3の削除方法
  
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


