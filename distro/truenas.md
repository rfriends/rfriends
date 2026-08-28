## TrueNASのDocker機能にrfriends3をインストールしてラジオ録音サーバにする。  
  
NASというのは２４H起動しているものなので、ラジオ録音には適しています。  
  
ここでは、SSD(HDD)が一台のみの構成で進めます。  
当然ですが、設定を行うと、SSD(HDD)は初期化されます。  
  
### １．TrueNASのインストール  
  
TrueNASのインストール方法についてはこちら。  
  
[TrueNASのインストール方法](truenas_install.md)  
  
### ２．TrueNASの初期設定  
  
WebブラウザでTrueNASにログインし以下の設定を行います。  
  
#### 2.1 Localization  
  
言語、キーボード、タイムゾーンを設定してください。  
<img width="481" height="665" alt="clip_5" src="https://github.com/user-attachments/assets/e72f4d34-1026-4224-88e4-45c8da155d03" />
　　
#### 2.2 ストレージの設定  
  
ストレージ - プールの作成  
  
レイアウトをストライプにし、SSD(HDD)をrfpoolとして、割り当てる。   
  
<img width="704" height="702" alt="clip_11" src="https://github.com/user-attachments/assets/d56d4870-61f7-47f8-b9be-42f665da5341" />  
  
>[!CAUSION]  
>この指定はデータが失われるという警告が出ていますが、NASとしては好ましくないのは確かです。  
>ここでは、NASを構築して、Dockerを動作させるのが目的なので、本格的なNASの構築は別途行ってください。  

#### 2.3 データセットの設定  
  
データセット - データセットの作成  
  
rfpool以下にrfdatasetとして作成する。  
  
<img width="439" height="500" alt="clip_15" src="https://github.com/user-attachments/assets/e7a061d1-0b1d-4749-bf35-608779550b7a" />  
  
#### 2.4 認証情報の設定   
  
認証情報 - ユーザ - 追加 - 保存  
<img width="960" height="649" alt="connect_1" src="https://github.com/user-attachments/assets/f54ccc2e-697b-44d5-baf7-f77d8986d9f9" />
  
SSH, その他の詳細（ホームディレクトリ等）の設定をよく見てください。  
設定漏れがあるとうまくいきません。  
なおここでは、ユーザ、パスワードを　rfuser / rfuser　としています。  
  
#### 2.5 共有の設定  
  
共有 - Windows(SMB)共有 - 追加  
  
<img width="481" height="681" alt="clip_21" src="https://github.com/user-attachments/assets/822dcdbf-809f-4d8b-aa12-bcdc03283fbf" />  
  
この手順で、rfdataset と rfuser　を追加する。　　
  
#### 2.6 サービスの設定  
  
システム - サービス  
  
<img width="733" height="584" alt="clip_22" src="https://github.com/user-attachments/assets/3a55a88e-4566-4d76-a967-6914389ef6a4" />  
  
FTP , SMB , SSH  を有効にする。  

#### 2.7 アプリの設定  
  
アプリ - 構成 - プールを選択  
rfpool  を選択  
  
  
### ３．TrueNASにSSHアクセス  
  
#### 3.1 SSHアクセス  
  
teraterm, rlogin等のsshクライアントを使用して  
TrueNASにrfuserでログインする  
  
```  
Linux truenas 6.12.99-production+truenas #1 SMP PREEMPT_DYNAMIC Wed Aug 12 13:43:54 UTC 2026 x86_64  
  
        TrueNAS (c) 2009-2026, iXsystems, Inc. dba TrueNAS  
        All rights reserved.  
        TrueNAS code is released under the LGPLv3 and GPLv3 licenses with some  
        source files copyrighted by (c) iXsystems, Inc. All other components  
        are released under their own respective licenses.  
  
        For more information, documentation, help or support, go here:  
        http://truenas.com  
  
Warning: the supported mechanisms for making configuration changes  
are the TrueNAS WebUI, CLI, and API exclusively. ALL OTHERS ARE  
NOT SUPPORTED AND WILL RESULT IN UNDEFINED BEHAVIOR AND MAY  
RESULT IN SYSTEM FAILURE.  
  
Welcome to TrueNAS  
rfuser@truenas:~$   
```  
  
Windowsの場合はターミナルを開き、  
```  
> ssh rfuser@192.168.1.19  
The authenticity of host '192.168.1.19 (192.168.1.19)' can't be established.
ED25519 key fingerprint is SHA256:o9p3G1W938bZ4xUTCQdC8/bYPETtVeXfolHZrQCc5kI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.1.19' (ED25519) to the list of known hosts.
(rfuser@192.168.1.19) Password:
```  
  
  
ここまでくれば、ゴールはもうすぐ  
  
#### 3.2 パーミッションの確認  
  
以下の操作を行い、rfuserで読み書きができることを確認する。  
  
```  
$ touch aaa  
$ ls -al aaa  
total 15  
drwx------ 2 rfuser rfuser    6 Aug 28 10:47 .  
drwxr-xr-x 4 root   root      4 Aug 28 10:29 ..  
-rw-r--r-- 1 rfuser rfuser  220 Aug 28 10:29 .bash_logout  
-rw-r--r-- 1 rfuser rfuser 3526 Aug 28 10:29 .bashrc  
-rw-r--r-- 1 rfuser rfuser  807 Aug 28 10:29 .profile  
-rw-r--r-- 1 rfuser rfuser    0 Aug 28 10:47 aaa  
$ rm aaa  
```  
  
### ４．rfriedns3のインストール  
  
Docker版rfriends3のインストールはこちら  
  
[docker版rfriends3でラジオ録音](docker.md)  

> [!CAUTION]
> 上記手順で一部変更があります。  
> dockerコマンドは、sudo をつけて実行してください。  
> sudo なしにする方法もありますが、ここでは省略します。
  
  
### ５．おわりに  
  
如何でしたでしょうか  
TrueNASの初期設定がちょっとむつかしいですが、  
それさえクリアしてしまえば、docker版rfriends3のインストールは簡単だったと思います。  
あとは本格的なＮＡＳの構築ですが、それは守備範囲外ということで。  
  
以上  
