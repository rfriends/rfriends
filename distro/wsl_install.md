## WSLのインストール  
  
　Windows Subsystem for Linux (WSL) では簡単にUbuntu等のLinuxが利用できます。wslのインストール方法について記述します。  
  
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
  

### 動作確認済ディストリビューション　(2026/08/12現在)  
  
ディストリビューションはアクセスしたときにより異なります。  
```
PS> wsl --list --online
```  
  
それぞれのrfriendsのインストール方法は以下を参照してください。  
[Linux版rfriends3でラジオ録音](https://rfriends.github.io/rfriends/distro/rfriends3_core.html)
  
|最終確認|判定|ディストリビューション|sh|備考|   
|---|:---:|---|---|---|  
|2025/05/02|〇|Ubuntu &nbsp;&nbsp;&nbsp;&nbsp;(26.04)|ubuntu||   
|2026/04/24|〇|Ubuntu-26.04|ubuntu||  
|2025/05/02|〇|Ubuntu-24.04|ubuntu||  
|2025/05/02|〇|Ubuntu-22.04|ubuntu||  
|||openSUSE-Leap-16.0|suse||   
|2025/05/02|〇|openSUSE-Tumbleweed|suse||  
|||openSUSE-Leap-16.0|suse||  
|||SUSE-Linux-Enterprise-15-SP7|suse||  
|||SUSE-Linux-Enterprise-16.0|suse||  
|2025/05/02|〇|kali-linux|debian||  
|2025/10/23|〇|Debian &nbsp;&nbsp;&nbsp;&nbsp;(13.1)|debian||  
|2025/05/02|〇|AlmaLinux-8|stream||  
|2025/05/02|〇|AlmaLinux-9|stream||  
|2025/05/02|〇|AlmaLinux-Kitten-10|stream||   
|||AlmaLinux-10|stream||  
|2025/05/02|〇|archlinux|arch||  
|||FedoraLinux-44|stream||  
|||FedoraLinux-43|stream|| 
|2026/02/07|✕|eLxr 12.0|debian|at not found|  
|2025/05/02|✕|OracleLinux_7_9|stream|yum<br>注１）|   
|2025/05/02|〇|OracleLinux_8_10|stream|8_7 注１）|  
|2025/05/02|〇|OracleLinux_9_5|stream|9_1 注１）|  
|2025/05/03|✕|SUSE-Linux-Enterprise-15-SP6|suse|lighttpd<br>not found|  

### 提供停止　(2026/08/12 現在)  
  
動作確認しましたが、提供されなくなったものです。  
  
|最終確認|判定|ディストリビューション|sh|備考|   
|---|:---:|---|---|---|  
|2025/05/02|〇|Ubuntu-18.04|ubuntu||  
|2025/05/02|〇|Ubuntu-20.04|ubuntu||  
|2025/05/02|〇|Debian &nbsp;&nbsp;&nbsp;&nbsp;(12)|debian||   
|2025/05/02|〇|openSUSE-Leap-15.6|suse||   
|2025/05/02|〇|FedoraLinux-42|stream||  

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

すでに、Ubuntu（2026/08/12 現在 Ubuntu 26.04）がインストールされています。  
  
```
wsl: ネスト化された仮想化はこのマシンではサポートされていません。
ディストリビューションが正常にインストールされました。'wsl.exe -d Ubuntu' を使用して起動できます
Ubuntu を起動しています...
Provisioning the new WSL instance Ubuntu
This might take a while...
```
     
新規の場合は、ユーザの作成とパスワードを要求されます。  
既存ユーザの場合は、新規にubuntu等をインストールするか、インストール済のディストリを起動してください。  
  
```
Create a default Unix user account: ユーザ名
New password: パスワード
Retype new password: パスワード
passwd: password updated successfully
```
  
WSLとUbuntuのインストールはこれで完了です。  
  
以上  
  

