## Docker Desktop for windows   
   
　windowsにDocker Desktopをインストールして実行する。
  
![win](https://github.com/user-attachments/assets/1ab06a07-e67e-422b-b7e4-473996614a6a)

## １．Docker Desktopのインストール  

・Docker Desktopをインストールしてください。  
  
[Docker Desktop for Windows](https://docs.docker.jp/docker-for-windows/install.html)  
  
・次に、Git Bashをインストールしてください。  
  
[Git Bash](https://gitforwindows.org/)  
  
Windows Terminalでgitが使用できるようにする。 
   
![1](https://github.com/user-attachments/assets/27e1b965-ccc8-4f60-957b-3c89b621a3cf)
  
ファイルを変更したときに改行コードを変更しない。  
  
![2](https://github.com/user-attachments/assets/570cc64c-a6e3-4e2f-88f5-8f194a7eefc0)  
   
## ２．実行  
  
  まず、Windows Terminalを実行します。  
　
### 2.1 rfriends_docker.gitをクローンする。  
  
```
cd ~/
rm -rf rfriends_docker
git clone https://github.com/rfriends/rfriends_docker.git   
```
<!--
エディタで、docker-compose.ymlを開き下記の個所をコメントにする。  
  
![g3](https://github.com/user-attachments/assets/25fef9e6-63da-453c-baf9-6f59b5b5e8e4)
-->
  
### 2.2 rfriends3のイメージを作成し実行する。

１）イメージの作成および実行を行う。  
  
```  
docke compose up 
...  
rfriendsが使用できます。  
```    
  
と表示されたら成功です。  
  
> [!TIP]
> "permission denied"のエラーが出る場合は以下を試してみてください。   
> sudo chmod 666 /var/run/docker.sock  
  
２）rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
  
ipconfigでホスト（windowspc）のIPアドレスを確認して、  
```
http://IPアドレス:8000
```
と入力するとrfriends3が表示されます。
 
> [!TIP]  
> ホストのIPアドレス:8000を入力すると、  
> 同一LAN内の他のPCからもアクセスできます。  
    
３）終了  
```
Windows Terminalでctl-cを3回入力してコンテナを終了させてください。
```
  
終了すると、rfriends3の実行も終了するため、Webアクセスはできなくなります。  
    
以上  
  
  
  

  
  
  

