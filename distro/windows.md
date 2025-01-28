## Windows版rfriends3のインストール手順  
  
初 版　2023/06/13  
第7版　2024/12/13　32bit版廃止  
第8版　2024/12/15　Github  
第9版　2025/01/26　wmic  
第10版　2025/01/26　renew  
  
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
  
https://github.com/rfriends/rfriends_windows/wiki/wmic  
  
## ２．インストール  
  
### 2.1 ダウンロード  
  
[rfriends3_windows.bat](https://raw.githubusercontent.com/rfriends/rfriends/main/storage/rfriends3_windows.bat)  
  
上記のリンクよりrfriends3_windows.batを右クリックし、「名前を付けてリンク先を保存」を選択し、rfriends3をインストールしたい場所に保存します。  
  
![clip_1](https://github.com/user-attachments/assets/a43b5c37-2e1e-4068-8d85-02f156b9a58d)  
![1](https://github.com/user-attachments/assets/aa3e7fdb-ff79-42c0-a757-7ccf6350a586)
  
> [!WARNING]  
>「安全でないダウンロードがブロックされました」と表示されたら、「保存」をクリックすればダウンロードされます。  
  
### 2.2 インストールの実行  
　ここでは、c:\Temp\にダウンロードしたと仮定します。  
  
　c:\Temp\windows_install.batを実行（ダブルクリック）します。  
　下記のような画面が出たら、詳細情報をクリックすると、実行ボタンが表示されます。  
  
![2-3](https://github.com/user-attachments/assets/b27a5cc4-6be1-4472-ad40-01d53b5b7a4c)  
  
実行をクリックします。  
  
![clip_2](https://github.com/user-attachments/assets/964bf5e6-5e10-40c1-bfb2-2175ff63408d)  
  
　実行が開始されると、「処理を開始しますか (y/n) ?」と聞かれるので、yを入力してください。  
  
![2-5](https://github.com/user-attachments/assets/d22c0d69-351e-45fe-8b45-f7ef08161739)  
  
  
　処理が開始されると、初めにrfriends3本体のダウンロードが始まり、その後自動的に解凍が行われます。  
  
![2-6](https://github.com/user-attachments/assets/2d11e4fe-37c2-4f4e-b9e6-b505bd56c1bd)  
  
　何かのキーを押せば、インストールは完了です。以下のようにc:\Tempにrfriends3ディレクトリが作成されます。windows_install.batは不要ですので、削除してかまいません。  
  
![2-7](https://github.com/user-attachments/assets/94709710-653e-4ebc-a317-914cd54bdf52)  
  
　デスクトップにrf3server(WebServer)のショートカットが作成されます。  
  
![2-8](https://github.com/user-attachments/assets/7d2925e0-7353-4aaf-942c-f3db9384af66)  
  
## ３．ビルトインウェブサーバの実行  
  
　rfriends3を実行する前にウェブサーバを実行しておく必要があります。デスクトップのショートカットrf3serverをダブルクリックすると、ビルトインウェブサーバが実行されます。　c:\Temp\rfriends3\rf3server.batでも同様です。  
  
![3-1](https://github.com/user-attachments/assets/8f68ebe4-8c36-47ed-99ed-ce3b116b4077)  
  
　ここに表示されるIPアドレス（ここでは、192.168.1.135:8000）をメモしてください。  
  
また、このウインドウは通常は最小化しておいてください。  
  
## ４．rfriends3の実行  
  
ウェブサーバが正常に動作したら、ウェブブラウザ（edge,chrome,firefox,...）を起動し、アドレスバーに３．でメモした  
  
XXX.XXX.XXX.XXX:8000　  
  
と入力するとrfriends3が起動します。以下のような画面が出たら成功です。  
  
![4-1](https://github.com/user-attachments/assets/b1db3100-809c-450f-9e1d-76014f6e7368)  
  
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
  
