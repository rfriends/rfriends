## Docker Engine   
   
　ubuntuにDocker Engine, Composeをインストールして実行する。
  
![lnx](https://github.com/user-attachments/assets/b37e4530-9416-4112-b76a-4e83f29ab8fe)

## １．Docker Enginee, Composeのインストール  
  
```
sudo apt update && sudo apt install curl -y  
curl https://get.docker.com | sudo sh  
sudo chmod 666 /var/run/docker.sock  
```  
確認  
```  
$ docker --version  
Docker version 27.5.0, build a187fa5  
  
$ docker compose version  
Docker Compose version v2.32.4
```  
     

      
以上  
  
  
  

