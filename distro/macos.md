## macOS版rfriends3でラジオ録音   
  
　rfriends3はWEBベースで操作が簡単になっています。  
  
第4版　2025/01/08 sequoia  
  
## １．環境  
  
　以下のバージョンで確認しました。macOSは新規インストールし、何も手を加えない状態でテストを行っています。  
  
・macOS sequoia 15.0 (確認済)  
・macOS sonoma 14.0 (確認済)  
・macOS Ventura 13.4.1  (確認済)  
・Monterey ,Big Sur ,Catalina(未確認)  
  
## ２．Homebrewのインストール  
  
Homebrew がインストール済の方は、この項を飛ばしてください。  
  
１）HomebrewのWebサイト（https://brew.sh/）を開き、インストールに表示されているコマンドをターミナルにCOPY&PASTEして実行する。  
  
2025/01/08 時点では以下のコマンドになっています。  
```  
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
```   
２）Homebrewのインストールが終了したら、念のためbrewを確認してください。  
```  
% brew doctor  
```  
Your system is ready to brew.  
  
と表示されたらインストールは成功です。  
  
## ３．rfriends_macos.gitのダウンロード  
  
Terminalを開き、以下を入力します。  
```  
% cd ~/  
% brew install git  
% rm -rf rfriends_macos  
% git clone https://github.com/rfriends/rfriends_macos.git  
```  
## ４．rfriends3のインストール  
  
以下を入力し、インストールを行う。各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成される。  
```  
% cd ~/rfriends_macos  
% sh rfriends_macos.sh  
```  
  
これでインストールは完了です。  
  
追記）  
```  
% chromium --version  
```  
でchromiumが見つからない場合はインストールしてください。  
```  
% brew install chromium  
```  
  
## ５．lighttpdウェブサーバのインストール  
  
以下を入力し、lighttpdをインストールする。  
```  
% cd ~/rfriends_macos  
% sh lighttpd_install.sh  
```  
## ６．rfriends3の実行  
```  
% ip a | grep "inet " | grep -v "127.0.0.1"  
```  
を入力してIPアドレスを知る。  
  
ウェブブラウザ（Safari,chrome,firefox,...）を起動し、アドレスに  
  
IPアドレス:8000  
  
と入力。以下のような画面が出たら成功です。  
  
![1](https://github.com/user-attachments/assets/a4ff3cfb-98b5-48e5-97d2-4d3525e6b4e9)  
   
「ヘルプ」「システム更新」でシステムを最新にしてください。  
  
## ７．rfriends3のアンインストール  
  
 デイリー処理設定をしている場合は、必ず、「設定」->「デイリー処理」->「取消」をしてください。  
 録音データは必要であれば別のところに保存してください。  
 rfriends3フォルダを削除してください。  
 アンインストールは終了です。  
  
以上  

