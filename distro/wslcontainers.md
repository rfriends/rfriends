## WSL Containers版rfriends3でラジオ録音  
   
　ラジオ録音アプリrfriends3を WSL Containers環境で実行する方法について記述しています。  
 
  
初版 2026/07/21
   
> [!NOTE]  
>   現在、書きかけです。 
   
  
## １． WSL Containers環境構築
  
WSL Containersは現在、ore-releaseです。  
バグがあってもやってみたい方用です。   
  
```
wsl --install
wsl --update --pre-release
wsl --shutdown  
```  
・確認  
```  
wslc.exe --version
wslc 2.9.3.0
```
   
## ２．実行  
  
イメージの作成から実行まではコマンドプロンプト上で以下の操作を行ってください。   
  
```
c:
cd temp   <-- 環境に応じて変更してください。
curl -L -o repo.zip https://github.com/rfriends/rfriends_docker/archive/refs/heads/main.zip
tar.exe -xf repo.zip
cd rfriends_docker
wslc build -t rfriends3 . 
run_wsl_containers.bat 
  
rfriendsが使用できます。  
```
  
と表示されたら成功です。  
  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
```  
> IPCONFIG  
192.168.1.142 ..........  
```
  
ホストののIPアドレスが192.168.1.142の場合、ブラウザに
```
http://192.168.1.142:8000
```
と入力するとrfriends3が表示されます。
 
> [!TIP]   
> 同一LAN内の他のPCからもアクセスできます。  
    
## ３．データ  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config  
  
## ４．その他  
  
なお、コンテナ版では、聴取は可能ですが、聴取（サーバ）は使用できません。  
どうしても使用したい方は、pulseaudioでのホスト連携処理を自己責任で追加してください。  
かなり面倒です。  
  
以上  
  
  
  
