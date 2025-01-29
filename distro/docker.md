## dockerでrfriends3の実行環境を作成してラジオ番組を録音する   
   
　rfriendsがどんなものか試してみたい方のためにdocker環境用に作成しました。 
  
　dockerに関しては初心者ですので、突っ込みどころ満載だと思います。  
  
![スクリーンショット 2025-01-19 160852](https://github.com/user-attachments/assets/475ec1f1-9314-4aa3-92eb-6b1dcdad0249)
  
## １．docker環境構築
    
１）操作するユーザをdockerグループに追加すればsudoなしでdockerが操作できます。  
```
sudo gpasswd -a $USER docker  
sudo systemctl restart docker  
exit  
```
再ログインしてください。  
  
２）docker環境は環境別に記述しています。  
  
### 1.1 Docker Engine    
  
https://github.com/rfriends/rfriends_docker/wiki/engine  
  
### 1.2 Docker desktop for Windows  
  
https://github.com/rfriends/rfriends_docker/wiki/windows  
  
### 1.3 Docker desktop for macOS  
  
https://github.com/rfriends/rfriends_docker/wiki/macOS  
  
  
## ２．コンテナの操作  
  
Webで起動が確認出来たら、ctrl-cを3回でコンテナを停止させてください。  
次に、以下のコマンドを入力してください。  
  
$ docker ps -a  
  

|CONTAINER ID   |IMAGE       |COMMAND                  |CREATED          |STATUS                        |PORTS     |NAMES|  
|---|---|---|---|---|---|---|
|7d58171ef373   |rfriends3   |"sh ./docker_start.s…"   |11 |minutes ago   |Exited (137) 32 seconds ago             |rfriends_docker-radio-1 | 
  
コンテナ名が、rfriends_docker-radio-1、となっているのがわかります。  
以下で再起動できます。  
  
$ docker start rfriends_docker-radio-1  
rfriends_docker-radio-1  
  
停止はctrl-cを3回ではなく、以下のコマンドになります。  
$ docker stop rfriends_docker-radio-1  
rfriends_docker-radio-1  

## ３．使用方法
  
１）システム構築後に、まずrfriends3を最新に更新してください。  
[ヘルプ]-[システム更新]で安定版1.1.3c以上にする。 
 
２）定期実行処理を登録する。  
**定期処理を行わない場合は、この処理は不要です。**  
  
[設定]-[定期実行]-[登録]でcrontab登録を実行する。  
crontab登録時に復元データを自動で作成します。  
  
３）使用法については、マニュアルおよびチュートリアルを参考にしてください。  
[マニュアル](https://github.com/rfriends/rfriends3/wiki)  
[チュートリアル](https://github.com/rfriends/rfriends3/wiki/%EF%BC%90%EF%BC%90%EF%BC%8E%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)  
  
## ４．データ保存・復元  
  
$HOME/share/smbdir/usr2  
$HOME/share/rfriends3/config  
  
コンテナを終了させても、上記の場所に録音データ、パラメータ設定が保存されています。 
  
予約データ、定期実行処理設定は消えます。  
自動復元処理により、コンテナの再起動時にそれらを（ほぼ）復元します。

> [!CAUTION]  
> ただし、復元するのはキーワード予約で、マニュアル予約は復元できません。  

   
  
以上  
  
  
  
