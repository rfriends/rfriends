## WSL+Ubuntu+rfriendsでラジオ番組を録音しよう  
  
　Windows サブシステム (WSL) では簡単にUbuntuが利用できます。それにrfriendsをインストールしてラジオ録音を楽しもうという企画です。  
  
![1](https://github.com/user-attachments/assets/429c1661-fd9c-4a80-87cb-cb3fb07661a4)   
  
初版：2024/11/15  
改版：2025/01/09  
  
## １．システム要件  
  
　PCがWindows 10 22H2以上、または、Windows 11であること。  
いままで、WSLを全くインストールしていない環境であること。  
  
　今後対応範囲を広げていきますが、まずは上記の制限を設けます。  
すでにwslをインストール済の環境でもほぼ問題ないとはおもいますが。  
  
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
> Ubuntuのターミナル時は、$   
>  
> とします。  
  
また、wslを実行しているPCを"ホストPC"、wsl下で実行しているLinuxを単に"Ubuntu"とします。  
  
## ３．wslとubuntuのインストール  
  
### 3.1 wslのインストール  
  
PowerShell(管理者)を起動し、以下のコマンドを実行します。( - は2個)  
```  
PS> wsl --update  
PS> wsl --install  
```
  
![2](https://github.com/user-attachments/assets/0252b8a4-5579-4e74-9499-12ea1c9c37e3)  
  
一旦、Windowsを再起動してください。  
  
### 3.2 ubuntuのインストール  
  
再起動すると、自動的にubuntuのインストールが始まります。  
インストールの終了を待ちます。  
  
ユーザーの作成を促されるので、user/passwordを入力してください。  
```  
Ubuntu は既にインストールされています。  
Ubuntu を起動しています...  
(略)  
Enter new UNIX username: user  
New password:  
Retype new password:  
(略)   
Welcome to Ubuntu 24.04.1 LTS   
```  
  
WSLとUbuntuのインストールはこれで完了です。  
  
### 3.3 インストール結果の確認  
  
インストールが正しく行われているかを確認します。  
  
PowerShell(管理者)を起動し、かつUbuntuのターミナルを開いた状態にしてください。  
  
１）PowerShellに以下のコマンドを入力します。  
```  
PS> wsl --version  
WSL バージョン: 2.3.26.0  
(略)  
Windows バージョン: 10.0.19045.5131  
2024/11/16 時点で、2.3.26.0 です。  
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
PRETTY_NAME="Ubuntu 24.04.1 LTS"  
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
  
タスクバーの検索窓にubuntuと入力してインストールしたUbuntuを開き、以下を入力します。  
```  
$ cd ~/  
$ sudo apt install -y git  
$ rm -rf rfriends_wsl  
$ git clone https://github.com/rfriends/rfriends_wsl.git  
$ cd rfriends_wsl  
$ sh rfriends3_wsl.sh   
4.2 インストール終了  
(途中略)  
ip address is lo UNKNOWN 127.0.0.1/8 eth0 UP 172.19.148.3/20 .  
visit rfriends at http://xxx.xxx.xxx.xxx:8000  
finished  
```  
  
finishedと表示されてインストールは完了です。表示されたIPアドレスをメモしてください。ここでは、172.19.148.3 です。  
  
次に、ubuntuを終了します。  
  
```  
PS> wsl --shutdown  
```  
  
## ５．rfriends3の設定  
  
### 5.1 Ubuntuの実行  
  
タスクバーの検索ボックスに"ubuntu"と入力してUbuntu を実行します。  
  
![4](https://github.com/user-attachments/assets/02d65525-cf2b-400c-980a-3c6704c2e1b9)  
  
### 5.2 rfriends3のWebサーバへのアクセス  
  
　4.でメモをしたIPアドレスを使ってrfriends3にアクセスします。  
  
ホストＰＣからWEBブラウザ（chrome,edge,firefox等）で上記で表示された  
  
xxx.xxx.xxx.xxx:8000  
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
  
![5](https://github.com/user-attachments/assets/e706bb5e-61a9-4da7-8d01-22ead1bab4ee)  
  
### 5.3 rfrirnds3を最新にアップデート  
  
ヘルプ - システム更新(SYS)  
  
により、rfriends3を開発版（1.1.2-a03以上）にupdateします。  
  
![6](https://github.com/user-attachments/assets/29c43981-c720-4bd1-8328-d166a2e0f272)  
 
以降、バージョンによりメニュー番号が異なっている可能性があります。  
  
### 5.4 デイリー処理の登録  
  
スリープを前提としたPCの場合はデイリー処理の登録は行わないでください。  
  
設定 - 定期実行 - 登録  
  
を選択し、crontab登録をクリックします。これにより、指定した時刻に予約・録音ができるようになります。  
  
![7](https://github.com/user-attachments/assets/4f5064ae-8caa-4ccb-80e9-029949cb5ed8)  
  
　Windowsの場合、24時間稼働を想定していないことが多いので、さらにスリープしない設定が必要です。  
  
ホストPC - 設定 > システム > 電源 > 画面およびスリープのタイムアウト  
  
次の時間の経過後にデバイスをスリープ状態にする - なし  
  
![8](https://github.com/user-attachments/assets/fa5eb0c1-e472-47f5-b42f-903353d49fb5)  
  
## 6．確認テスト  
  
Timefree - 録音・聴取  
  
で、１，２個試しに録音してみてください。  
  
![9](https://github.com/user-attachments/assets/53a32b62-54de-45e0-93e4-46dfeeca2c4a)  
  
　録音が終了したら、ホストPCのディレクトリC:\rf3\usrを参照してください。録音したファイルがtimefree以下に見つかるとおもいます。 
  
![10](https://github.com/user-attachments/assets/2af0c22c-bd42-4fc7-bfc0-2b29322522f9)  
  
　以上で、rfriendsのインストールは終了です。  
  
## ７．その他  
  
### 7.1 外部PCからのwebアクセス  
  
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
  
## ８．最後に  
  
　より良いものにするために、バグ報告・改善提案等をお待ちしています。  
  
では、素敵なラジオライフを！  
  
  
以上  

