## macOS(qemu)版rfriends3でラジオ録音   
  
qemu版rfriends3は、仮想環境で、イメージをダウンロードして実行するだけで、rfriends3が立ち上がります。  
より良い音を目指して、音のチューニングもしています。  
  
 現在、書きかけです。  
  
第1版　2026/07/25 new  
  
[!IMPORTANT]
> なお、現在は、テスト中なので、  使用結果を掲示板等で報告ができる方のみ使用してください。  
> 報告がむつかしい方は、正式リリースまでお待ちください。  

  
## １．環境  
  

以下のバージョンで確認しました。  
  
・silicon macOS tahoe 26.3.1(確認済)  

  
## ２．Homebrew のインストール  
  
Homebrew がインストール済の方は、この項を飛ばしてください。  
  
以下を参考にHomebrewをインストールしてください。  

[Homebrewのインストール](homebrew.md)  

  
## ３．qemu版rfriends3イメージのダウンロード  
  
以下をクリックして、任意の場所に保存してください。（約1.2GB）  
  
[rfriends3_qemu.zip]()
    
## ４．rfriends3の実行  
  
ターミナルを開き、rfriends3_qemu.zipがある場所に移動します。  
ここでは、ホームディレクトリと仮定しています。  
 
```  
% cd ~/
% unzip rfriends3_qemu.zip
% cd rfriends3_qemu
% ./run_rfriends3.sh  
```  
  
ブラウザで、http://localhosts:8000 にアクセスして、以下のような画面が出たら成功です。    

  
![1](https://github.com/user-attachments/assets/a4ff3cfb-98b5-48e5-97d2-4d3525e6b4e9)  
   
「ヘルプ」「システム更新」でシステムを最新にしてください。  
  
## ５．注意点  
  
・録音データは、インストールしたrfriends3_qemuのshareフォルダ下にあります。  
```
rfriends3_qemu

env.txt
rfriends3_arm64.qcow2
run_rfriends3.sh
share　<-- これ
```
  
・インストール時は聴取（サーバ）では音がミュートになっています。  
 音量調整すれば、音が出るようになります。 
   
## ６．rfriends3のアンインストール  
  
 デイリー処理設定をしている場合は、必ず、「設定」->「デイリー処理」->「取消」をしてください。  
 録音データは必要であれば別のところに保存してください。  
 rfriends3_qemuフォルダを削除してください。  
 アンインストールは終了です。  
  
以上  

