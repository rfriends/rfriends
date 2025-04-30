## WSL+Ubuntu版rfriends3でラジオ録音  
  
　Windows サブシステム (WSL) では簡単にUbuntuが利用できます。それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2024/11/15  
改版：2025/01/09  
  
## １．システム要件  
  
AI による概要  
  
WSL2 (Windows Subsystem for Linux 2) を使用するには、Windows 10 (x64) バージョン 1903 以降 (ビルド 18362.1049+) または Windows 11 が必要です。
また、64ビットのプロセッサ、4GB以上のRAM、そして仮想マシンプラットフォーム機能が有効化されている必要があります。﻿    
    
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
 
> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Linuxのターミナル時は、$   
>  
> とします。  
  
また、wslを実行しているPCを"ホストPC"、wsl下で実行しているLinuxを単に"Linux"とします。  
  
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

現在ではいろいろなディストリビューションが利用できますが、ここではubuntuをインストールします。  
PowerShellを起動し、以下のコマンドを実行します。  
```
PS> wsl install ubuntu
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
  
### 3.3 インストール結果の確認  
  
インストールが正しく行われているかを確認します。  
  
Ubuntuのターミナルを開いた状態で、もう一つPowerShellを起動してください。  
  
１）新たに起動したPowerShellに以下のコマンドを入力します。  
```  
PS> wsl --version  
WSL バージョン: 2.4.13.0  
(略)  
Windows バージョン: 10.0.26100.3915
```  
  
2）PowerShellに以下のコマンドを入力します。  
```  
PS> wsl -l -v  
NAME      STATE           VERSION  
* Ubuntu    Running         2  
wsl version2でUbuntuが実行されています。  
```  
  
3）Ubuntuのターミナルに以下を入力します。  
```  
$ cat /etc/os-release  
PRETTY_NAME="Ubuntu 24.04.2 LTS"  
(以下略)  
Ubunutu 24.04 が実行されています。  
```  
  
4）Ubuntuのターミナルに以下を入力します。  
```  
$ df  
```  
 
![3](https://github.com/user-attachments/assets/ce362e42-dbca-40f6-837b-d4366358be5b)  
 
C:\  が /mnt/c にマウントされています。バージョンによっては/media/c の場合もあります。その場合はrfriendsの録音ディレクトリの変更が必要です。  
  
4）Ubuntuのターミナルに以下を入力します。  
  
systemdが有効になっているがどうかがわかります。  
```  
$ cat /etc/wsl.conf  
[boot]  
systemd = true  
```  
  
wsl.confの内容が上記と違う場合、またはファイルが存在しない場合は、ここでインストールを中止して環境の見直しを行ってください。  
  
## ４．rfriends3のインストール  
  
### 4.1 インストール  
  
PowerShellを起動し、以下のコマンドを実行します。   
```
PS> wsl -d ubuntu  

$ cd ~/  
$ sudo apt install -y git  (gitがすでにインストールされている場合は不要)
$ rm -rf rfriends3_core
$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core 
$ sh install_ubuntu.sh
```
  
### 4.2 インストール終了    
  
```
ip address is lo UNKNOWN 127.0.0.1/8 eth0 UP 172.19.148.3/20 .  
visit rfriends at http://xxx.xxx.xxx.xxx:8000  
finished  
```  
  
finishedと表示されてインストールは完了です。表示されたIPアドレスをメモしてください。  
  
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
  
![4](https://github.com/user-attachments/assets/02d65525-cf2b-400c-980a-3c6704c2e1b9)  
  
### 5.2 rfriends3のWebサーバへのアクセス  
  
　4.2でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
  
![5](https://github.com/user-attachments/assets/e706bb5e-61a9-4da7-8d01-22ead1bab4ee)  
  
### 5.3 チュートリアル
  
マニュアルのページのチュートリアルで基本的な操作を覚えてください。  
  
[マニュアル](https://rfriends.github.io/rfriends/manual/)  

## ６．rfriendsのデータにアクセス
  
　Windowsのエクスプローラを開くと、左メニューにLinuxという項目があると思います。  
それをクリックすると、右にUbuntuというフォルダが表示されます。  
以下、Ubuntu¥home¥ユーザ名¥smbdir¥usr2 を辿っていけばrfriendsのデータにアクセスできます。   

## ７．外部PCからのwebアクセス  
  
　同一LAN内の外部PCからrfriendsへのアクセスを行うための設定は以下のとおりです。通常は、この設定は行わないほうがいいと思います。  
  
　外部PCからWebアクセスするためには以下の2つの設定が必要になります。  
  
１）ホストPCのfirewallの設定で、ポート8000を開放する。  
  
　ホストPCで"セキュリティが強化されたWindows Defender ファイアウォール"  
  
を開きます。  
  
受信の規則 - ポート - 次へ - 特定のローカルポート 8000 - 接続を許可する - 次へ -プライベート -次へ - 名前を入力して - 完了  
  
２）ホストPC ->Ubuntu へのポートフォワーディングを設定する。  
```  
PS> netsh.exe interface portproxy add v4tov4 listenaddress=＜外部PCのipアドレス＞listenport=8000 connectaddress=＜ホストPCのipアドレス＞ connectport=8000  
```  
  
以上  

