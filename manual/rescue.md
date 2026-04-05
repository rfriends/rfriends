## rfriends3の回復方法  
   
rfriends3が突然動かなくなった。  
rfriends3のシステムアップデートに失敗した。  
通常は、rfriends3の「ヘルプ- レスキュー」で回復できます。  
  
それでも回復できない場合、以下の手順を実行してください。  
　　
初版 2023/07/22  
改版　2026/04/06  
  
## １．Windowsの場合  
  
### 1) エクスプローラの起動  
  
- エクスプローラでrfriends3をインストールしている場所を開く。    
  
<img width="600" height="400" alt="t1" src="https://github.com/user-attachments/assets/28015ece-8fda-4385-ac3a-26ae8b463605" />
  
### 2) コマンドプロンプトの起動  
  
- cmd と入力し、コマンドプロンプトを開く。  
  
<img width="600" height="400" alt="t2" src="https://github.com/user-attachments/assets/f5be4c94-a8ad-4590-ba6c-8e4216042e11" />
  
- コマンドプロンプトが開く。  
  
<img width="600" height="400" alt="t3" src="https://github.com/user-attachments/assets/5bc61b89-52b2-42ce-a559-fdf919e12a49" />
  
### 3) rescueファイルのダウンロード  
  
- 以下の入力を行い、rescueファイルをダウンロードする。
  
~~~
curl rf3.s331.xrea.com/rescue.zip -o rescue.zip
~~~
  
<img width="600" height="452" alt="t4" src="https://github.com/user-attachments/assets/a2de8ef7-5ac3-40f4-9ff9-f228deb56cad" />
  
### 4) rescueファイルの解凍  
  
- 以下の入力を行い、rrescueファイルを解凍する。  
   
~~~
tar xzvf rescue.zip
~~~
   
<img width="600" height="458" alt="t5" src="https://github.com/user-attachments/assets/89f6ea2e-0c6f-445a-8c88-2a52e5d33273" />
  
- rescueファイルの解凍が終了し、コマンドプロンプトが表示されるのを待つ。  
   
<img width="599" height="400" alt="t6" src="https://github.com/user-attachments/assets/abb6e9a8-c213-4d0a-b32c-8cf8fbbe592d" />
  
以上でレスキュー処理は終了。  
  
## ２．Linuxの場合  

BSD,macOS等も同様の手順で可能です。
    
- ターミナル(SSHでも可)を起動する。

<img width="600" height="412" alt="l1" src="https://github.com/user-attachments/assets/e07b7e2e-fcb3-4be9-9f3f-19c90ab17f77" />

- rfriends3をインストールしているディレクトリに移動し、以下のコマンドを入力する。  
  
ここでは、/home/rpi にrfriends3がインストールされている。  
移動先は /home/rpi/rfriends3 ではないので要注意。  
  
~~~
$ cd /home/rpi
$ curl rf3.s331.xrea.com/rescue.zip -o rescue.zip
$ tar xzvf rescue.zip
~~~
  
以上でレスキュー処理は終了。 
  
## ３．システム更新  
  
- rfriends3を起動し、「ヘルプ - システム更新」で最新版にする。

これで回復できない場合は、システムを再インストールする。    


以上  
  
