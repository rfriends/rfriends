## Windows版rfriends3でラジオ録音  
  
初 版　2023/06/13  
第7版　2024/12/13　32bit版廃止  
第8版　2024/12/15　Github  
第9版　2025/01/26　wmic  
第10版　2025/01/26　renew  
第11版　2025/10/20　renew  
第12版　2026/02/05　dialog  
  
## １．環境  
  
　以下のバージョンで実行可能です。  
Windowsは新規インストールし、何も手を加えない状態でテストを行っています。  
拡張子を表示する設定にしておいてください。  
  
home/proどちらでもOK  
  
Windows11  
Windows10 (x64) 1809以降  
  
> [!CAUTION]  
> Windows 11 24H2を新規インストールした方へ  
> wmicのインストールの必要があります。  
  
Windows11 24h2用 wmicのインストール方法について  
  
[wmicのインストール方法](wmic.md)  
  
## ２．インストール  
  
### 2.1 ダウンロード  
  
[rfriends3_windows.bat](https://ss1.xrea.com/rf3.s331.xrea.com/storage/rfriends3_windows.bat)  
  
上記のリンクよりrfriends3_windows.batを右クリックし、「名前を付けてリンク先を保存」を選択し、保存します。  
  
![1](https://github.com/user-attachments/assets/aa3e7fdb-ff79-42c0-a757-7ccf6350a586)  
  
> [!WARNING]  
>「安全でないダウンロードがブロックされました」と表示されたら、「保存」をクリックすればダウンロードされます。  
  
### 2.2 インストールの実行  
　ここでは、c:\Temp\にダウンロードしたと仮定します。  
  
　c:\Temp\windows_install.batを実行（ダブルクリック）します。  
　下記のような画面が出たら、詳細情報をクリックすると、実行ボタンが表示されます。  
  
![2](https://github.com/user-attachments/assets/2d78308b-4fd1-4534-8b12-68eeb56a19b9)  
  
実行をクリックします。  
  
![3](https://github.com/user-attachments/assets/198ba710-8314-451f-b657-3bc08861186e)  
  
  実行が開始されると、インストールフォルダを選択するダイアログが表示されるので、選択してください。  
![clip_1](https://github.com/user-attachments/assets/ea58e03c-9ef5-4e65-bf31-3d63d0a39be3)  
   
　次に、「処理を開始しますか (y/n) ?」と聞かれるので、yを入力してください。  
  
![4](https://github.com/user-attachments/assets/59075292-5ec9-422e-981d-bde94f3642d1)  
  
　処理が開始されると、初めにrfriends3本体のダウンロードが始まり、その後自動的に解凍が行われます。  
  
![5](https://github.com/user-attachments/assets/6b45dba3-560f-4154-8f7c-1ee8ed62041a)  
  
　何かのキーを押せば、インストールは完了です。選択した場所にrfriends3ディレクトリが作成されます。  
 windows_install.batは不要ですので、削除してかまいません。  
  
![6](https://github.com/user-attachments/assets/bb411e02-5b9f-4785-bf71-53411afaf80e)  
  
　デスクトップにrf3server(WebServer)のショートカットが作成されます。  
  
![7](https://github.com/user-attachments/assets/020b2261-abd8-485a-a7f7-b84a245edea1)  
  
## ３．ビルトインウェブサーバの実行  
  
　rfriends3を実行する前にウェブサーバを実行しておく必要があります。デスクトップのショートカットrf3serverをダブルクリックすると、ビルトインウェブサーバが実行されます。　rfriends3\rf3server.batでも同様です。  
  
![8](https://github.com/user-attachments/assets/b37110ca-41f2-4aef-9a38-06733cddc7da)  
  
　ここに表示されるIPアドレス（ここでは、192.168.1.135:8000）をメモしてください。  
  
また、このウインドウは通常は最小化しておいてください。  
  
## ４．rfriends3の実行  
  
ウェブサーバが正常に動作したら、ウェブブラウザ（edge,chrome,firefox,...）を起動し、アドレスバーに３．でメモした  
  
XXX.XXX.XXX.XXX:8000　  
  
と入力するとrfriends3が起動します。以下のような画面が出たら成功です。  
  
![9](https://github.com/user-attachments/assets/1e06829e-9329-4d9b-a398-c75f16a4af88)  
  
## ５．rfriends3のアンインストール  
  
 デイリー処理設定をしている場合は、必ず、「設定」->「デイリー処理」->「取消」を行ってください。  
  
 録音データは必要であれば別のところに保存してください。  
 rfriends3フォルダを削除してください。  
  
 これでアンインストールは終了です。  
  
## ６．他端末からアクセス  
  
・他端末からアクセスする方法   
  
Windowsファイヤオールの設定でポート8000の受信を許可にする必要があります。  
  
詳細は「windows ポート 許可」で検索してください。  
  
以上  
  
