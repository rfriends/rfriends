## ios版rfriends3でラジオ録音  
  
！！！開発中　執筆途中！！！  






  
iPhone/iPad 用rfriends3はiSH Shellアプリにインストールして動作します。　  
現在は、CLIモードでの動作しかしませんが、近い将来、GUIモード（ブラウザアクセス）もサポート予定です。 
   
<img width="600" height="564" alt="ish" src="https://github.com/user-attachments/assets/c09423b4-361a-4497-bc1c-ba4b1fa68b13" />

  
初 版　2025/07/18   
二 版　2025/07/22   
  
## １．iSH Shell　ソフトウエア  
  
使用しているソフトウエアはiSH Shellで、ios上のlinux-like shell(alpine linux)です。  
  
iSH Shellのインストールは以下から可能です。  
[download](https://apps.apple.com/jp/app/ish-shell/id1436902243)  
  
また、iSH Shell のサイトは以下のとおり。  
[github](https://github.com/ish-app/ish/)  
  
## ２．インストール準備  
以下のことを確認してください。 
 
1) iSH Shellをインストールする。
2) iSH Shellを設定する。  
  
・画面右下の(i)をタップする。    
  
<img width="236" height="119" alt="ish3" src="https://github.com/user-attachments/assets/ff8c201d-da81-45c0-af51-bdd2fa7f2c09" />  
  
・Keep Screen Turned OnをONにする。  
  
<img width="600" height="290" alt="ish2" src="https://github.com/user-attachments/assets/53220add-6b12-4afe-9c79-51d813371159" />  
  
  
3) 以下のコマンドを実行する。  

```  
# apk update
# apk upgrade

# apk add sudo
# apk add git
```
  
## ３．rfriends3のダウンロードとインストール  
  
　iSH Shellを実行します。  
 
> [!CAUTION]
> 現在はrootで実行しますが、
> 将来的にはユーザモードで実行するようにします。
    
  
　rfriends3インストールスクリプト（install_ish.sh）を実行します。    
 各種ツールがインストールされ、ホームディレクトリにrfriends3ディレクトリが作成されます。  
  
```  
# cd ~/
# rm -rf rfriends3_core   
# git clone https://github.com/rfriends/rfriends3_core.git  
# cd rfriends3_core  
# sh install_ish.sh
```  
  
これでインストールは完了です。  
再起動してください。  
```
# exit
```
再起動すると、以下のような画面になります。  
<img width="600" height="450" alt="ish6" src="https://github.com/user-attachments/assets/25c76549-2c32-40a1-adab-06a069c4f492" />


psコマンドを入力してください。
```
# ps aux
```
<img width="600" height="450" alt="ish7" src="https://github.com/user-attachments/assets/c14e01cb-d451-41e3-af93-19c12400d55f" />

以下の２つが表示されていることを確認してください。  
```
/usr/sbin/atd
crond
```
  
## ４．rfriends3の実行  
  
以下を入力します。  
```  
# cd
# sh rfriends3.sh
```  
  
以下のような画面が出たら成功です。  
<img width="600" height="450" alt="ish4" src="https://github.com/user-attachments/assets/86fbc1c8-e9bd-4008-a0c2-e8da8d57829d" />

  
「10-1」でシステムを最新にしてください。（1.2.4-b1 以上）  
詳細な使用方法は、  
https://rfriends.github.io/rfriends/manual/  
を参照してください。    
  
## ５．samba  
  
　現在、未サポートです。  
  
## ６．rfriends3のアンインストール  
  
デイリー処理設定をしている場合は、必ず、「9-3」のデイリー処理で、rfriends3関連の設定を削除してください。  
または、crontab -e です。  
> [!CAUTION]
> システム関連の設定を消さないようにしてください。
  
rfriends3フォルダを削除してください。  
アンインストールは終了です。  
  
  

以上  
