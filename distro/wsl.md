## WSL+Linux版rfriends3でラジオ録音  
  
　Windows Subsystem for Linux (WSL) では簡単にUbuntu等のLinuxが利用できます。それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2024/11/15  
改版：2026/08/19  

> [!NOTE]
> 以下、混乱しがちなので    
> PowerShellの時は PS>  
> Linuxのターミナル時は、$   
>  
> とします。
> また、wslを実行しているPCを"ホストPC"、wsl下で実行しているLinuxを単に"Linux"とします。
  
## １．wslのインストール  
  
もし、すでにwsl,linuxのインストールが済んでいる方は、２．に進んでください。  　 

> [!NOTE]  
> wslのインストール方法について詳しく知りたい方は、  
> [wslのインストール](wsl_install.md)    

### 1.1 仮想化の確認と設定  

wslを実行にするには、仮想化が有効である必要があります。  
以下を参考に設定してください。

[Windowsの仮想化を有効にする](win_virtual.md)

### 1.2 wslのインストール

wslのインストールは、ターミナル（管理者）を開き、以下を入力してください。
```  
PS> wsl --install  
```
PCを再起動すればインストールは完了です。 
  
### 1.3 Ubuntuのインストール

Ubuntuのインストールは、ターミナルを開き、以下を入力してください。
```  
PS> wsl --install  -d Ubuntu

ダウンロードしています: Ubuntu
インストールしています: Ubuntu
ディストリビューションが正常にインストールされました。'wsl.exe -d Ubuntu' を使用して起動できます
Ubuntu を起動しています...

ユーザ名、パスワードを入力してください。

Create a default Unix user account: user 
New password:
Retype new password:
passwd: password updated successfully

Canonicalによる匿名のデータ取集を許可する場合はy、拒否する場合はnを入力して下さい。

Would you like to opt-in to platform metrics collection (Y/n)? To see an example of the data collected, enter 'e'.
[Y/n/e]: n
```
  
## ２．rfriends3のインストール  
  
### 2.1 インストール  
  
PowerShellを起動し、以下のコマンドを入力しUbuntuを実行します。   
```
PS> wsl -d Ubuntu
```
Ubuntu上で以下を入力してください。  
  
```
$ cd         <--- これを忘れないように！

$ sudo apt update && sudo apt upgrade -y  
[sudo: authenticate] Password: パスワード (install時に設定したもの)  
  
$ sudo apt install -y git  (gitがすでにインストールされている場合は不要)
$ rm -rf rfriends3_core 　 (初めての場合は不要)

$ git clone https://github.com/rfriends/rfriends3_core.git  
$ cd rfriends3_core
  
$ sh install_ubuntu.sh
```
インストール完了までしばらくお待ちください。
  
### 2.2 インストール終了    
  
```
IP address : 10.255.255.254/32 172.31.205.45/20

Mon Aug 17 19:11:55 JST 2026
end install common
...
finished  
```
finishedと表示されてインストールは完了です。  
いくつかのエラーが表示されますが、インストールの共通化によるものです。  
  
表示されたIPアドレスをメモしてください。  
または、以下のコマンドでも確認できます。 
```
$ hostname -I
172.31.205.45
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
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）に   
  
172.31.205.45:8000  
（このアドレスは、環境により異なります。）    
  
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


