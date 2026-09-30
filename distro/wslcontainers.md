## WSL Containers版rfriends3でラジオ録音  
   
　ラジオ録音アプリrfriends3を WSL Containers環境で実行する方法について記述しています。  
 
  
初版 2026/07/21  
三版 2026/09/30
     
  
## １． WSL Containers環境構築
  
~~WSL Containersは現在、pre-releaseです。~~  
2026/09/30 正式リリースされました。   
9/30 正式版にて動作を確認しました。 
  
正式版は、wsl 3.0.1.0 に含まれているため、wsl --update が必要です。  
  
```
> wsl --install  <-- インストール済の場合は不要です。  
> wsl --update  
> wsl --shutdown  
```  
・確認  
```  
> wsl --version
WSL バージョン: 2.9.3.0.1.0

> wslc.exe --version
wslc 3.0.1.0

> wslc run --rm hello-world
  
Hello from Docker!
This message shows that your installation appears to be working correctly.

```
   
## ２．実行  
  
イメージの作成から実行まではコマンドプロンプト上で以下の操作を行ってください。   
> [!IMPORTANT]  
> コンテナ名、イメージ名、ポートを変更する場合は、.envファイルを編集してから実行してください。  
> 特に、既にport8000で別のrfriendsを実行している場合は、ポート変更が必須です。

```
> c:
> cd \temp   <-- 環境に応じて変更してください。
> curl -L -o repo.zip https://github.com/rfriends/rfriends_docker/archive/refs/heads/main.zip
> tar.exe -xf repo.zip
> cd rfriends_docker-main
> wslc container rm rf3-container
> run_wsl_containers.bat 

コンテナー ID       画像          コマンド           作成済み   状態             ポート            名前
e304de7ab59c   rfriends3   "sh ./docke…   1 秒前   Up Less tha…   127.0.0.1:8…   rf3-contain…

```
  
と表示されたら成功です。  

  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  

```
http://localhost:8000
```
と入力するとrfriends3が表示されます。  
  
<img width="444" height="371" alt="clip_1" src="https://github.com/user-attachments/assets/30ffd670-66af-4d62-88ca-26a872028b83" />
  

## ３．データ  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config  
  
## ４．その他  
  
なお、コンテナ版では、聴取は可能ですが、聴取（サーバ）は使用できません。  
どうしても使用したい方は、pulseaudioでのホスト連携処理を自己責任で追加してください。  
かなり面倒です。  
  
以上  
  
  
  
