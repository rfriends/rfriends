## Windows向けrfriends3のqemu版でラジオ録音      
  
rfriends3のqemu版は、仮想環境で、イメージをダウンロードして実行するだけで、rfriends3が立ち上がります。     
  
第1版　2026/07/27 new  
第3版　2026/07/29 加筆    
  
[!IMPORTANT]
> なお、現在は、テスト中なので、  使用結果を掲示板等で報告ができる方のみ使用してください。  
> 報告がむつかしい方は、正式リリースまでお待ちください。  

  
## １．環境  
  
以下のバージョンで確認しました。  
  
・Windows11 26H1  
  
## ２．確認と設定  

qemuを実行にするには、以下の３つ機能が有効である必要があります。  
これは、一度設定すればよく、毎回の必要はありません。  
  
設定に不安がある方は、中止してください。  
  
### 2.1 BIOS/UEFIの仮想化機能  
  
タスクマネージャのCPUの項目を開き、仮想化が有効になっていたら、次に進んでください。
<img width="634" height="349" alt="clip_4" src="https://github.com/user-attachments/assets/5c17817f-91f5-4ef5-8b3e-241473021d41" />

無効の場合は、PCを一度完全にシャットダウンし、  
起動時にF2やDeleteキーを連打してBIOS（UEFI）画面を開き、  
以下の項目を「Enabled」に変更する必要があります。  
  
Intel製CPUの場合: Intel Virtualization Technology や VT-x  
AMD製CPUの場合: SVM Mode や Secure Virtual Machine  
  
### 2.2 Windows の機能      
  
スタートボタンの横にある検索バーに「Windows の機能」と入力します。  
[Windows の機能の有効化または無効化] を開きます。  
  
「Windows ハイパーバイザー プラットフォーム」    
「仮想マシン プラットフォーム（Virtual Machine Platform）」    
をチェックし、有効にします。  
  
<img width="415" height="467" alt="clip_5" src="https://github.com/user-attachments/assets/94c01820-3925-4fd1-9441-3a54ac751e96" />

[OK] を押したあと、PCを再起動してください。  
  
  
## ３．qemu版rfriends3イメージのダウンロードとインストール（約1.4GB）   
  
ブラウザで、以下のリンクを右クリックし、任意の場所に保存してください。  
ここではc:\tempとしています。  

[qemu_instwin.bat](https://ss1.xrea.com/rfbuddy.s296.xrea.com/storage/qemu_instwin.bat)

次にダウンロードした、qemu_instwin.bat をダブルクリックします。    
<img width="696" height="305" alt="clip_8a" src="https://github.com/user-attachments/assets/cfd9acd6-2ac1-4576-a31a-3a5c17be55ba" />

[!CAUTION]
> スマートセキュリティコントロールにより、実行できない場合、
> 保存したディレクトリで、コマンドプロンプトを開き、
> qemu_instwin.bat
> と入力してください。
  
qemu_instwin.bat を実行すると、以下のように表示されます。　
  
```    
rfriends3_qemu.zip をダウンロードします。  
  
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current  
                                 Dload  Upload  Total   Spent   Left   Speed  
100  1.34G 100  1.34G   0      0 10.97M      0   02:05   02:05         11.11M  
  
rfriends3_qemu.zip を解凍します。  
  
 ドライブ F のボリューム ラベルは qemu です  
 ボリューム シリアル番号は 7A5F-3F00 です  
  
 C:\temp\rfriends3_qemu のディレクトリ  
  
2026/07/27  12:48    <DIR>          .  
2026/07/27  14:39    <DIR>          ..  
2026/07/27  09:42               515 env.bat  
2026/07/27  12:48    <DIR>          qemu  
2026/07/27  12:40     1,394,016,256 rfriends3.qcow2  
2026/07/27  09:23             1,153 run_rfriends3.bat  
               3 個のファイル       1,394,017,924 バイト  
               3 個のディレクトリ  51,374,968,832 バイトの空き領域  
  
run_rfriends3.batでrfriends3を実行できます。
```
  
以上でインストールは完了です。  
  
## ４．rfriends3の実行  
  　　
## 4.1 実行  
  
エクスプローラを開き、rfriends3_qemu ディレクトリに移動し、 
run_rfriends3.bat をダブルクリックして実行します。  
 
<img width="704" height="332" alt="clip_9" src="https://github.com/user-attachments/assets/c1deb92a-96a7-4b41-a90f-e2c6ebb53357" />
    
以下のようなログイン画面になります。  
<img width="642" height="537" alt="clip_10" src="https://github.com/user-attachments/assets/01e59d27-a14a-452b-8c71-129834134452" />

  
この時点ですでにrfriends3は起動しています。      
  
ブラウザで、http://localhost:8000 にアクセスして、以下のような画面が出たら成功です。    
  
他でポート8000で実行しているものがあると、失敗します。  
他を終了させるか、env.batのポート設定を変更して、再度実行してください。   
例）　8000 -> 8001

env.bat
set "HOST_WEB_PORT=8000" 

unzip後のrfriends3_qemu_win.zipは不要です。削除してもかまいません。  
  
<img width="415" height="399" alt="clip_1" src="https://github.com/user-attachments/assets/04b24640-485e-404c-9bf5-7014d16bd8aa" />

   
「ヘルプ」「システム更新」でシステムを最新にしてください。  

[!CAUTION]
> qemu画面を終了してしまうと、rfriends3も終了します。  
> ご注意ください。
 
  
## 4.2 終了    
  
・rfriends3の終了方法は2つあります。    
- user でログインし、sudo poweroff (安全)
- qemu画面を閉じる   
  
## 4.3 ログインユーザ  
  
初期状態のログイン可能ユーザのパスワードは以下のとおり  
安全のため、パスワードは変更してください。 
  
- user / user  
- root / rfriends  
  
## 4.4 env.bat  
  
env.batは実行環境設定です。  
ほとんど変更の必要はありません。  
変更する場合は、変更に失敗したときのためにバックアップをとってから行ってください。（自己責任）  
 
```
:: env.bat
:: 2026/07/27

set "BASE_DIR=%~dp0"  <-- env.txtがある場所
set "QEMU_DIR=%BASE_DIR%qemu"  <-- qemu
set "IMG_FILE=%BASE_DIR%rfriends3.qcow2"  <-- ゲスト本体

:: マシンスペック
MEM_SIZE="1G" <-- メモリサイズ
CPU_CORES="2" <-- cpuコアの数

:: ポートフォワーディング
set "HOST_WEB_PORT=8000" <-- webのポート
set "HOST_SSH_PORT=2222" <-- sshのポート
set "HOST_SMB_PORT=4445" <-- smbのポート
```
    
## 4.5 録音データ  



### 4.5.1 samba(Windows)
  
Windows11 24H2 以降の場合になります。  
  
コマンドプロンプトを開き、以下を入力します。  
Y:は空いているドライブ名、localhostはIPアドレスでもいいです。
```  
net use Y: \\localhost\smbdir /TCPPORT:4445
コマンドは正常に終了しました。
```
エクスプローラを開くと、Yドライブがあると思います。  
<img width="611" height="333" alt="clip_14" src="https://github.com/user-attachments/assets/1889bb5f-be7c-44a4-8987-529c560de0ed" />
  
もし、Yドライブを削除したい場合は、  
```
net use Y: /delete
```
  
### 4.5.2 samba(Linux)
  
録音データへの他PC(Linux)からのアクセス方法を紹介します。  
  
#### 1) ファイルアプリを起動し、ネットワークメニューを選択します。 

接続窓に、 rfriends3を実行しているWindowsのアドレスを入力し、接続します。  
ここでは、192.168.1.137と仮定し、以下のように入力しています。
```
smb://192.168.1.137:4445
```
<img width="748" height="430" alt="1" src="https://github.com/user-attachments/assets/9c063e2c-2184-4ccf-a049-4eb549dea7f8" />
  
### 4.5.3 sftp
  
録音データへのアクセス方法はいろいろありますが、ここではwinscpのsftpアクセスを紹介します。  
  
#### 1) winscpのインストール  

以下より、アプリをダウンロードし、インストールしてください。  
  
[winscp](https://winscp.net/eng/download.php)
  
#### 2) winscpの実行  
  
winscpを実行すると、サイトの登録画面になります。  
以下のように入力して保存してください。  

<img width="646" height="423" alt="clip_7" src="https://github.com/user-attachments/assets/51a18d54-90aa-4cb7-962f-7d6b366e0d8d" />
  
#### 3) ログイン  
  
ログインを実行すると、rfriends3の録音データディレクトリが表示されます。  
あとは必要なデータをコピーするだけです。  
  
 <img width="779" height="502" alt="clip_6" src="https://github.com/user-attachments/assets/8d70fc06-a90e-48e3-8206-7087a56966f6" />
  
また、sshクライアントにrloginを使っている方は、標準でsftp機能が使えます。  
  
#### 2) ログイン

ログイン情報を入力し、接続します。  
  
<img width="534" height="465" alt="2" src="https://github.com/user-attachments/assets/409923b0-e5f2-4f35-9c6c-e0eb7e14813f" />

#### 3) smbdir一覧

録音データディレクトリ(smbdir)が表示されるので、後は自由にデータにアクセスしてください。 
<img width="748" height="503" alt="3" src="https://github.com/user-attachments/assets/9428c105-ea58-4987-82c1-bd989e479f1c" />
 


## 4.6 その他  
  
・インストール時は聴取（サーバ）では音がミュートになっています。  
 音量調整すれば、音が出るようになります。 
  
<img width="524" height="548" alt="clip_2" src="https://github.com/user-attachments/assets/d8e707d5-925c-4ba8-932c-0ffc80582b0a" />

   
## ５．rfriends3のアンインストール  
  
rfriends3を終了し、rfriends3_qemuフォルダを削除してください。  
アンインストールは終了です。  
  
アンインストールしても、録音データはホストのshareフォルダに残っています。 
  
以上  

