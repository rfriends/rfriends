## dockerのインストール方法
   
dockerのインストール方法について、OD別に記述します。  
   
  
![engine](https://github.com/user-attachments/assets/2d6ffc34-7771-438e-9057-0cf7ccb93a28)
  
## １．docker環境構築
  
dockerのインストールは環境別に記述しています。  
dockerのインストールに関する詳細はネットで検索すると親切なサイトがたくさん見つかるので、ここでは省略します。  
  
### 1.1 Docker Enginee, Composeのインストール  
  
![10](https://github.com/user-attachments/assets/2be51085-b960-41e5-89ea-c29cc58ed233)    
  
Linux環境の方は以下の操作を行ってください。  
  
```
sudo apt update && sudo apt install curl -y  
curl https://get.docker.com | sudo sh  
sudo chmod 666 /var/run/docker.sock  
```  
・確認  
```  
$ docker --version  
Docker version 27.5.0, build a187fa5  
  
$ docker compose version  
Docker Compose version v2.32.4
```
  
・操作するユーザをdockerグループに追加する。  
  
```
sudo gpasswd -a $USER docker  
sudo systemctl restart docker  
exit  
```
  
再ログインしてください。  
sudoなしでdockerが操作できます。 
  
### 1.2 Docker Desktop for macOSのインストール  
  

  
![20](https://github.com/user-attachments/assets/ac099242-4684-4ebf-9a41-da3cd68d3c88)  
  
macの方は以下のサイトを参考にインストールしてください。  
公式のサイトからdmgファイルをダウンロードしてインストールするだけです。  
  
[Mac に Docker Desktop をインストール](https://docs.docker.jp/docker-for-mac/install.html)    
  
### 1.3 Docker Desktop for windowsのインストール  
  
![30](https://github.com/user-attachments/assets/d91db14c-eb5b-40aa-be50-3f91fc6c02e8)  
  
Windowsの方は以下の操作を行ってください。  
  
・以下よりDocker Desktop for Windowsをダウンロードし、インストールしてください。    
  
[Docker Desktop](https://www.docker.com/get-started/)  

詳細は以下を参考にしてください。  
  
[Docker Desktop for Windows](https://docs.docker.jp/docker-for-windows/install.html)  
  
・次に、Git Bashをインストールしてください。  
  
[Git Bash](https://gitforwindows.org/)  
  
Windows Terminalでgitが使用できるようにする。 
   
![1](https://github.com/user-attachments/assets/27e1b965-ccc8-4f60-957b-3c89b621a3cf)
  
ファイルを変更したときに改行コードを変更しない。  
  
![2](https://github.com/user-attachments/assets/570cc64c-a6e3-4e2f-88f5-8f194a7eefc0)  
   


以上  
  
  
  
