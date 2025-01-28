## rfriends2の回復方法  
  
rfriends2用です。rfriends3の方は、[こちら](rescue.html)  
  
rfriends2が突然動かなくなった。  
rfriends2のシステムアップデートに失敗した。  
  
上記のような症状の方は以下の手順でシステムを回復してください。  
  
## １．内蔵版アップデート  
  
・ Windowsの場合  
  
rfriendsをインストールしている場所にあるrf_up.batをダブルクリックする。  
  
```  
rfriends2\rf_up.bat  
```  
  
・ Linux,macOSの場合  
  
terminalを起動し、rfriendsをインストールしている場所にあるrf_up.shを実行する。  
  
```  
cd rfriends2  
  
sh rf_up.sh  
```  
  
このような画面が表示されたら安定版を選択してアップデートしてください。  
  
![clip_3](https://github.com/user-attachments/assets/bca96006-fe11-4feb-bde5-60be9d1177e1)  
  
上記操作を行っても復帰しない場合は、２．以降を試してください。  
  
## ２．rfriends2用ダウンロード版アップデート   
  
rfriends2 用です。   
  
・ Windowsの場合  
  
[rescue_rfriends2.zip](https://github.com/rfriends/rfriends_rescue/releases/latest/download/rescue_rfriends2.zip)  
  
ダウンロードしたrescue_rfriends2.zipをダブルクリックします。  
中のrfriends2フォルダをrfriends2がインストールされている場所にドラッグ＆ドロップしてください。  
その際、「ファイルを置き換える」を選択してください。  
その後、以下を実行してください。  
  
```  
cd rfriends2  
rf_up.bat  
```  
  
・ Linux,macOSの場合  
  
以下を実行してください。  
```  
cd ~/（rfriends2がインストールしている場所）  
sudo apt-get install wget -y   
wget https://github.com/rfriends/rfriends_rescue/releases/latest/download/rescue_rfriends2.zip  
unzip -o rescue_rfriends2.zip  
cd rfriends2  
sh rf_up.sh  
```  
  
あとは通常通りシステムを起動し、システムを最新にアップデートしてください。  
  
これで回復できない場合は、システムを再インストールしてください。  
  
  
初版 2023/07/22  
改版 2025/01/29  
