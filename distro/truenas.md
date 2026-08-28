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
  
#### 2.2 認証情報の設定  
  
認証情報 - ユーザ - 追加 - 保存  
  
rfuser / rfuser  
  
#### 2.3 ストレージの設定  
  
ストレージ - プールの作成  
  
#### 2.4 データセットの設定  
  
データセット - データセットの作成  
  
#### 2.5 共有の設定  
  
共有 - Windows(SMB)共有 - 追加  
  
rfdataset  
rfuser  
  
#### 2.6 サービスの設定  
  
システム - サービス  
  
FTP  
SMB  
SSH  
  
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
  
### ５．おわりに  
  
如何でしたでしょうか  
TrueNASの初期設定がちょっとむつかしいですが、  
それさえクリアしてしまえば、docker版rfriends3のインストールは簡単だったと思います。  
あとは本格的なＮＡＳの構築ですが、それは守備範囲外ということで。  
  
以上  
