## rfriends3の回復方法  
  
rfriends3用です。rfriends2の方は、[こちら](rescue-2.html)  
  
rfriends3が突然動かなくなった。  
rfriends3のシステムアップデートに失敗した。  
  
上記のような症状の方は以下の手順でシステムを回復してください。  
  
## １．内蔵版アップデート  
  
・ Windowsの場合  
  
rfriendsをインストールしている場所にあるrf_up.batをダブルクリックする。  
  
```  
rfriends3\rf_up.bat  
```  
  
・ Linux,macOSの場合  
  
terminalを起動し、rfriendsをインストールしている場所にあるrf_up.shを実行する。  
  
```  
cd rfriends3  
  
sh rf_up.sh  
```  
  
このような画面が表示されたら安定版を選択してアップデートしてください。  
  
![clip_3](https://github.com/user-attachments/assets/bca96006-fe11-4feb-bde5-60be9d1177e1)  
  
上記操作を行っても復帰しない場合は、２．以降を試してください。  
  
  
## ２．rfriends3用ダウンロード版アップデート   
  
rfriends3 用です。  
  
・ Windowsの場合  
   
まず、以下のリンクより、レスキューシステム rescue.zipをダウンロードしてください。  

[rescue.zip](https://raw.githubusercontent.com/rfriends/rfriends/main/storage/rescue.zip)  
  
ダウンロードしたrescue.zipをダブルクリックします。  
中のrfriends3フォルダをrfriends3がインストールされている場所にドラッグ＆ドロップしてください。  
その際、「ファイルを置き換える」を選択してください。  
  
・ Linux,macOSの場合  
  
rescue.zipをrfriends3をインストールしている場所（通常ホームディレクトリ）にダウンロードし解凍してください。  
  
```  
cd ~/（rfriends3をインストールしている場所）  
sudo apt-get install wget -y   
wget https://raw.githubusercontent.com/rfriends/rfriends/main/storage/rescue.zip  
unzip -o rescue.zip  
```  
  
あとは通常通りシステムを起動し、システムを最新にアップデートしてください。  
  
これで回復できない場合は、システムを再インストールしてください。  
  
初版 2023/07/22  
改版 2025/01/29  
