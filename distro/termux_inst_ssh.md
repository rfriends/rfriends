## Termuxのインストール方法（SSH版）  
  
Termuxは、AndroidやChrome OS上でLinux環境を実行できるターミナルエミュレータアプリです。  
ここでは、androidスマホ/タブレットにTermuxをインストールし、sshアクセスする方法について記述しています。    

> [!NOTE]
> 上級者向けの解説となっているので、通常は以下を参照してください。  
> [ Termuxのインストール方法](termux_inst.md)  
   
初版：2026/09/06  
改版：2026/09/06
  
## １．準備  
  
以下のものが必要。  
  
androidスマートホンまたはタブレット(OS7以上)  
androidOS7未満では動作しない。  
    
## ２．Termuxのインストール   
  
以下よりtermuxをダウンロードしてインストールする。  
  
v0.119.0-beta.3 - 2025-05-22 10:48  
[termux](https://github.com/termux/termux-app/releases)     
  
### ３．opensshのインストール  
  
termuxを起動し、opensshをインストールする。  
  
```  
pkg install openssh -y  
sshd  
```
  


パスワードを設定する。　　
 ```  
passwd   
````  

IPアドレスを確認する。  　　
 ```  
ifconfig  
````

以上で、sshアクセスの準備完了。  
  
### 4．sshアクセス  
  
sshクライアントでtermuxにログインする。  
IPアドレスはifconfigで表示されたものを使用する。  
  
例えばLinuxからなら  
```  
ssh termux@ipアドレス -p 8022  
```  
    
## ５．Termuxのセットアップ   
  
セットアップで必ず実行することは3つ。  
  
#### 5.1 termuxのミラーサイトを変更する。    
  
```  
termux-change-repo
```  

ミラーをグループにするかシングルにするかの選択画面が出るが、そのままOK。  
ミラーグループの選択画面が出るが、   
Mirrors in Asia All in Asia (excl. Chinese) を選択。  
  
#### 5.2 termuxのパッケージの更新   
  
```  
pkg update  
```
  
#### 3.3 termuxのstorageをセットアップする。   
   
```  
termux-setup-storage  
```  
  
（android端末側で）全てのファイルの管理権を付与する。  
これにより、termuxからandroid側のファイルにアクセスできるようになる。    
  
#### 3.4 exit   
  
```  
exit  
```  
  
これでTermuxのインストールは完了。  
  
以上  
  
