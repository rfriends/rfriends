# iPhone/iPad版rfriendsの簡単インストール

rfriends3のインストールからDevelopmentサーバの起動までを自動で行います。  
ただし、現在はテスト中のため、guiモードではなく、cuiモードが起動します。  

## １．iSH Shell  
  
iSHはインストール済とします。  
iSHをタップして起動します。  
<img width="200" height="200" alt="ish22" src="https://github.com/user-attachments/assets/819285e0-9d3b-4aa9-b6fb-3b6b19619bff" />  

以下のような画面が表示されます。  
  
<img width="500" height="889" alt="open" src="https://github.com/user-attachments/assets/849cf0d6-c248-4719-bb2d-c8cfca24e694" />
  
赤い矢印の指す「歯車」をタップします。    
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
インストールが完了後、以下のいづれかを起動してください。  
・cuiモード  
```  
# cd  
# sh cui  
```  
  
・guiモード  
```  
# cd  
# sh gui  
```
    

## ３．ブラウザの操作  
  
guiモードの場合、safariブラウザを立ち上げ、  
```
localhost:8000
```
と入力します。  
以下のような画面が表示されれば成功です。  
  
<img width="500" height="889" alt="rf3" src="https://github.com/user-attachments/assets/12d40ce8-6766-4417-850b-61c49882f021" />

  


  
  
以上  
