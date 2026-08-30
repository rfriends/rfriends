## Termux版rfriends3でラジオ録音    
  
余ったandroidスマホとTermuxでラジオ録音サーバを作ろう  
  
　WindowsPCをラジオ録音のために24時間稼働させるのはちょっと大変ですよね。  
 そこで、 余ったandroidスマホ/タブレットでrfriendsを動かしてラジオ録音サーバにしようというものです。  

   
<img width="600" height="400" alt="1778346585-qLbpuRWdBDcTlaZm25Y0KnMo" src="https://github.com/user-attachments/assets/64ec7db3-57a6-430b-932b-447d4316a443" />  
  
注）　時計表示ソフトを入れると、表向きは置時計、裏でrfriendsが走るというシステムができます。  
  
初版：2021/01/19  
改版：2026/08/30  
  
>[!CAUTION]
>このページは使用するスマホのブラウザで開いてください。  
>ブラウザに、'rfriends3 termux'と入力して検索すると簡単です。  
   
## １．Termuxのインストール   
  
### 1.1 必要なもの  
  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット((Android OS 7 以上)  
microSDに対応のもののほうがベター  
  
### 1.2 インストール  
  
Termuxのインストール方法については、以下のリンクを参照してください。  
  
[Termuxのインストール方法](termux_inst.md)  
  
## ２．インストールスクリプトのダウンロード  
  
以下より、インストールスクリプト(termux.zip)をスマホのダウンロードディレクトリにダウンロードする。  

   
[termux.zip](https://raw.githubusercontent.com/rfriends/rfriends_termux/main/termux.zip)  
   
  
  
## ３．rfriends3のインストール  
  
### 3.1 Termuxの起動  
  
Termuxを起動してください。  
  
![3](https://github.com/user-attachments/assets/5b603b6c-b936-4f29-9ee4-c2445ece319a)  
  
  
これ以降は、Termux内での操作となります。  
  
![4b](https://github.com/user-attachments/assets/399dbc52-b091-4683-b1a0-ce0a47a7ad0f)  
    
### 3.2 ツールおよびrfriends3をインストールする  
  
先ほどダウンロードしたインストールスクリプト(termux.zip)をunzipして実行する。  
  
```
$ cd
$ cd storage/downloads
$ unzip termux.zip
$ sh termux.sh  
```  
    
### 3.3 サービス（atd, crond,sshd,lighttpd,smbd）およびwake-lockの有効化  
  
インストールスクリプトが完了したら、以下を入力して、サービスを有効化してください。  
  
```  
1. exit で termux を終了 (終了しないとサービスの有効化で失敗します。)    
2. 再度 termux を起動  
3. sh svenable.sh を実行  
```    
  
次のような画面が出たら、"許可"を押してください。これにより予約録音ができるようになります。  

![12](https://github.com/user-attachments/assets/85e21570-0565-4e83-a46d-f499effdb3da)  

  
また、ロック画面に以下のようなメッセージが表示されます。  
  
![13](https://github.com/user-attachments/assets/6484a8ca-92de-4b72-8895-8c965b4dae3d)  
  
wake-lockの有効化を行わないと、スマホがスリープしたときにTermuxも停止してしまい録音が中断されます。  
ただし、有効化した場合は、ACアダプタに接続しての運用を行ってください。  
スマホを再起動したときは再度確認が必要です。  
  
スクリプトが完了したら、以下のような画面が出ます。    
  
![9a](https://github.com/user-attachments/assets/3e616185-a053-473d-bf0c-b67bc3cfe938)  

  
上記アドレスをメモしてください。  
  
以上でrfriends3のインストールは完了です。  
Webサーバ（lighttpd）はすでに起動しています。  
  
  
## ４．rfriends3にアクセス  
  
### 4.1 rfriends3のWebサーバへのアクセス  
  
termuxをインストールしたスマホまたは同一LAN に接続されたPC等から、WEBブラウザ（chrome,edge,firefox等）で上記でメモした   
  
xxx.xxx.xxx.xxx:8000   
  
と入力し、以下のような画面が出たら成功です。ブックマークすると便利です。  
  
![9](https://github.com/user-attachments/assets/4db21ecd-f876-4fac-8a65-19d1f28fe9d5)
  
  
### 4.2 チュートリアル  

まずは、チュートリアルでrfriends3の操作に慣れてください。  
  
[チュートリアル](https://rfriends.github.io/rfriends/manual/tutorial.html)  
  
  
## ５．録音ディレクトリ    
  
### 5.1 録音ディレクトリの設定（内部）  
  
　初期はスマホのダウンロードディレクトリに設定されています。通常はそのまま変更する必要はありません。  
  
rfriends3の画面で  
  
設定 - 録音フォルダ  
  
を選択し、録音データの格納場所を指定します。  
  
・スマホのダウンロードディレクトリの場合  
  
```  
usrdir=/data/data/com.termux/files/home/storage/downloads/usr2/  
tmpdir = ""  
```  
  
### 5.2 録音ディレクトリの設定（microSD）  
  
microSDを録音ディレクトリに設定する方法は、以下を参照してください。  
  
[Termux版rfriends3でmicroSDを使う](termux_microsd.md)
  
   
## ６．録音データ 

### 6.1 ファイラー  
    
スマホに標準で入っているファイラー(files等)でダウンロードディレクトリを開けば録音データにアクセスできます。  

<img width="600" height="764" alt="Screenshot_20260821-175210" src="https://github.com/user-attachments/assets/7bdc64d3-3816-44af-80dd-b948c145d82c" />  
  
### 6.2 sambaアクセス  
    
sambaでのアクセス方法は以下を参照してください。  

[sambaアクセス](termux_smb.md)
  
### 6.3 sftpアクセス  
    
sftpでのアクセス方法は以下を参照してください。  

[sftpアクセス](termux_sftp.md)  
    
## ７．その他
  
### 7.1 外部PCからのSSHアクセス  
  
外部からSSHアクセスをしない方は以下の操作は不要です。  
  
SSHアクセスのためのパスワードを設定してください。  
  
  
```  
$ passwd  
```  
  
これで、4.1で取得したIP アドレスを使って、ＰＣ等から  
  
```  
ssh -p 8022 hogehoge@XXX.XXX.XXX.XXX  
```  
  
でアクセスできます。hogehogeは任意です。  
  
teratermやRLoginを使用すると便利です。  
  
PCがLinuxでWARNINGが出て接続できないときはPCのホームディレクトリの.ssh/known_hostsを削除してみてください。  
  
### 7.2 Bluetooth スピーカ  
  
インストール直後は、スマホのスピーカから音が出ていると思います。  
これに、スマホの標準機能で、Bluetooth スピーカを接続すれば、rfriends3からの音もBluetooth スピーカから出ます。  
当然ですが、念のため。  
  
    
以上    
  
  
