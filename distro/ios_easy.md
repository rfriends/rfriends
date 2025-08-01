# Apple版rfriends3でラジオ録音  
    
  
> [!CAUTION]
> 現在開発中のため、インストールに関しては人柱状態です。  
> 正常に動作する保証はありません。  
  
iPhone/iPad/MacOS 用rfriends3はiSH Shellアプリにインストールして動作します。　  
cui,gui両モードをサポートしました。  
ただし、guiモードは現在不安定です。 
お試しと考えてください。  


## １．iSH Shell  
  
使用しているソフトウエアはiSH Shellで、ios上のlinux-like shell(alpine linux)です。  
ios 11 以上が必要です。MacOSでも動作しますが、M1以上のプロセッサが必要です。  
  
### 1) App StoreからiSHを入手し、インストールしてください。  

![IMG_0952](https://github.com/user-attachments/assets/0a0e4c4e-db3a-42c8-9a0b-711d20b54891)
  
  
### 2) iSHをタップして起動します。 
  
<img width="200" height="200" alt="ish22" src="https://github.com/user-attachments/assets/819285e0-9d3b-4aa9-b6fb-3b6b19619bff" />  
  
  
### 3) 赤い矢印の指す「歯車」をタップします。
  
<img width="500" height="889" alt="open" src="https://github.com/user-attachments/assets/849cf0d6-c248-4719-bb2d-c8cfca24e694" />


  
「Keep Screen Turned ON」をONにします。  
「Done」をタップします。

<img width="500" height="889" alt="screen" src="https://github.com/user-attachments/assets/35b49485-9abc-45e4-998b-1830424b6909" />
   
  
## ２．rfriends3のインストール  
  
以下を入力します。  
```
# cd  
# rm ish  
# wget rf3.s331.xrea.com/ish  
# sh ish  
```
これでインストールは完了です。  
    
## ３．rfriends3の操作  

### 3.1 cuiモード  
  
1) rfriends3をcuiモードで起動します。  
  
```  
# cd  
# sh cui  
```  
  
2) 以下のような画面が表示されれば成功です。  
  
![IMG_0949](https://github.com/user-attachments/assets/528dc96e-6bcd-4d08-ab05-7f4779e928a1)
  
### 3.2 guiモード    
  
1) rfriends3をguiモードで起動します。  
  
```  
# cd  
# sh gui  
```
   
2) 以下のような画面が表示されます。  
  
![IMG_0950](https://github.com/user-attachments/assets/94de7c08-035e-4cb8-a8a7-495813131b8d)
  
3) 次に、rfriends3をインストールしているiPhoneで、safariブラウザを立ち上げ、  
```
localhost:8000
```
と入力します。 
  
4) 以下のような画面が表示されれば成功です。  
  
![rf3](https://github.com/user-attachments/assets/223adaad-251a-41ad-8d01-0fd4c47bc533)

  


  
  
以上  
