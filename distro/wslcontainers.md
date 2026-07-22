## WSL Containers版rfriends3でラジオ録音  
   
　ラジオ録音アプリrfriends3を WSL Containers環境で実行する方法について記述しています。  
 
  
初版 2026/07/21  
二版 2026/07/22
   
> [!NOTE]  
>   現在、書きかけです。 
   
  
## １． WSL Containers環境構築
  
WSL Containersは現在、pre-releaseです。  
バグがあってもやってみたい方用です。   
実際かなり不安定です。うまくいかない場合はPCを再起動するとうまくいくことがあります。  
  
```
> wsl --install
> wsl --update --pre-release
> wsl --shutdown  
```  
・確認  
```  
> wsl --version
WSL バージョン: 2.9.3.0

> wslc.exe --version
wslc 2.9.3.0

> wslc run --rm hello-world
イメージ 'hello-world' が見つかりません。プルしています
latest: Pulling from library/hello-world
4f55086f7dd0: Pull complete
Digest: sha256:c3cbe1cc1aa588a64951ac6286e0df7b27fe2e6324b1001c619bb358770c0178
Status: Downloaded newer image for hello-world:latest

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
> run_wsl_containers.bat 
コンテナー ID       名前              画像          作成済み            状態                      ポート
57eb87f46705   rf3-container   rfriends3   2 minutes ago   running 2 minutes ago   127.0.0.1:8000->8000/tcp
```
  
と表示されたら成功です。(画像と表示されるところはプレビューらしいですね)  

  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  

```
http://localhost:8000
```
と入力するとrfriends3が表示されます。

## ３．データ  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config  
  
## ４．その他  
  
なお、コンテナ版では、聴取は可能ですが、聴取（サーバ）は使用できません。  
どうしても使用したい方は、pulseaudioでのホスト連携処理を自己責任で追加してください。  
かなり面倒です。  
  
以上  
  
  
  
