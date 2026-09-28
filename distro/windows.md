## Windows版rfriends3でラジオ録音  
  

  
## １．環境  
  
以下のバージョンで実行可能です。  
拡張子を表示する設定にしておいてください。    
  
Windows11  home/pro  
Windows10 (x64) home/pro 1809以降  
  
  
## ２．インストール  
  
インストールは3ステップで完了です。  
  
・インストーラのダウンロード（rfriends3_windows.bat）  
・インストーラの実行  
・インストール場所の選択    
  
### 2.1 インストーラのダウンロード  
  
[rfriends3_windows.bat](https://ss1.xrea.com/rf3.s331.xrea.com/storage/rfriends3_windows.bat)  
  
上記のリンクよりrfriends3_windows.batを右クリックし、「名前を付けてリンク先を保存」を選択し、保存します。  
  
![1](https://github.com/user-attachments/assets/aa3e7fdb-ff79-42c0-a757-7ccf6350a586)  
  
### 2.2 インストーラの実行  
　ここでは、c:\Temp\にダウンロードしたと仮定します。  
   

  
　c:\Temp\rfriends3_windows.batを実行（ダブルクリック）します。  
   
 <img width="466" height="344" alt="スクリーンショット 2026-04-11 220517" src="https://github.com/user-attachments/assets/b77a50e2-3b74-48eb-8d1d-585172c7f60f" />    
  
実行をクリックします。  
  
### 2.3 インストール場所の選択  
  
  実行が開始されると、インストールフォルダを選択するダイアログが表示されるので、選択してください。  
  
![clip_1](https://github.com/user-attachments/assets/ea58e03c-9ef5-4e65-bf31-3d63d0a39be3)  
  
> [!CAUTION]  
> c:\ではインストールできません。  
> 以外のディレクトリを指定してください。   
   
　次に、「処理を開始しますか (y/n) ?」と聞かれるので、yを入力してください。  
  
![4](https://github.com/user-attachments/assets/59075292-5ec9-422e-981d-bde94f3642d1)  
  
　処理が開始されると、初めにrfriends3本体のダウンロードが始まり、その後自動的に解凍が行われます。  
  
![5](https://github.com/user-attachments/assets/6b45dba3-560f-4154-8f7c-1ee8ed62041a)  

インストールが完了すると、「続行するには何かキーを押してください」と表示されるので、  
何かのキーを押せば画面が閉じられ、選択した場所にrfriends3ディレクトリが作成されます。  
  
![407470382-bb411e02-5b9f-4785-bf71-53411afaf80e](https://github.com/user-attachments/assets/b5d5b1e9-7bb9-4bfd-a824-b5220685faae)  
  
　また、デスクトップにrf3server(WebServer)のショートカットが作成されます。  
  
![7](https://github.com/user-attachments/assets/020b2261-abd8-485a-a7f7-b84a245edea1)  
  
  これで、インストールは完了です。  
  
## ３．ビルトインウェブサーバの実行  
  
　rfriends3を実行する前にウェブサーバを実行しておく必要があります。  
 デスクトップのショートカットrf3serverをダブルクリックすると、ビルトインウェブサーバが実行されます。  
 (rfriends3\rf3server.batでも同様です。)   
  
![8](https://github.com/user-attachments/assets/b37110ca-41f2-4aef-9a38-06733cddc7da)  
  
ここに表示されるIPアドレス（ここでは、192.168.1.135:8000）をメモしてください。  
  
また、このウインドウは通常は最小化しておいてください。  
  
> [!CAUTION]    
> この時、以下のようなメッセージ(vcruntime140.dllが見つからない)が出るときは、  
> 以下のパッケージをインストールして、再度ビルトインウェブサーバを実行してください。
>   
> Visual C++ v14 再頒布可能パッケージ
> https://aka.ms/vc14/vc_redist.x64.exe
  
<img width="476" height="198" alt="スクリーンショット 2026-03-13 095134" src="https://github.com/user-attachments/assets/551d321c-65b9-4d93-a733-43d009f2f198" />
   

  
## ４．rfriends3の実行  
  
ウェブサーバが正常に動作したら、ウェブブラウザ（edge,chrome,firefox,...）を起動し、アドレスバーに３．でメモした  
  
XXX.XXX.XXX.XXX:8000　  
  
と入力するとrfriends3が起動します。以下のようなrfriends3のトップ画面が出たら成功です。  
  
![clip_2](https://github.com/user-attachments/assets/d782464a-3085-4f7f-9cdb-522235e2b657)  

## ５．rfriends3の更新   
  
まず、rfriends3を最新にしてください。  
  
メニュー - ヘルプ - システム更新  
を選択し、1.正式版を選択します。  
  
<img width="335" height="415" alt="clip_1a" src="https://github.com/user-attachments/assets/8aa4a18c-4a13-4c58-b5fe-9d4c05a0bd6b" />  

アップデートしますか?  

「OK」をクリックするとアップデートされます。  
    
## ６．その他    
  
### 6.1 wmicのインストール  
      
Windows 11 24H2以降のバージョンの方へ  

Microsoftにより、wmicが無効化されています。wmicをインストールすると、処理が高速になります。  
wmicのインストール方法については以下を参照してください。  
  
[wmicのインストール方法](wmic.md)  

### 6.2 他端末からアクセス  
  
・他端末からアクセスする方法   
  
Windowsファイヤオールの設定でポート8000の受信を許可にする必要があります。  
  
詳細は「windows ポート 許可」で検索してください。  
  
### 6.3 rfriends3のアンインストール  
  
 デイリー処理設定をしている場合は、必ず、「設定」->「デイリー処理」->「取消」を行ってください。  
  
 録音データは必要であれば別のところに保存してください。  
 rfriends3フォルダを削除してください。  
  
 これでアンインストールは終了です。  

   
以上  
  
初 版　2023/06/13  
第7版　2024/12/13　32bit版廃止  
第8版　2024/12/15　Github  
第9版　2025/01/26　wmic  
第13版　2026/03/13 vcruntime140.dll  
第15版　2026/09/28 一部書き換え  

  
