## Windows11 24h2用 wmicのインストール方法について  
  
rfriends3では、録音状況の表示にwmicコマンドを使用しています。  
  
![タイトルなし](https://github.com/user-attachments/assets/0639d6ba-9d9a-4554-ab3f-c23d47b4349d)



ところがWindows11 24h2から標準ではwmicが使えなくなってしまいました。  
前バージョンからのアップデートは使えるらしい。  
  
とはいえ、現状使えないと困るので、インストールの方法を記述します。  
  
### 1. 現状の確認  
  
ターミナル(Power Shell)を開いて、wmicと入力してください。  
以下のように表示されたら、使えないので次に進んでください。  
  
![clip_1](https://github.com/user-attachments/assets/3ec139ba-2eb6-4adf-acfc-145056b38db2)

  
### 2. オプション  
  
設定 - システム - オプション機能  
を選択してください。  
  
![clip_2](https://github.com/user-attachments/assets/0b46a1d9-21ed-4348-b30c-3da51aa07ffb)

  
### 3. 機能表示  
  
オプション機能の「機能を表示」を選択してください。  
  
![clip_3](https://github.com/user-attachments/assets/38f4dca2-b115-4126-880b-e606bf27e3d6)

  
### 4. WMIC  
  
「WMIC」をチェックして、「次へ」を選択してください。  
  
![clip_4](https://github.com/user-attachments/assets/da2c8bb6-47a7-4107-a89e-8ef29a0b5ab7)

  
### 5. 追加  
  
「追加」を選択してください。  
  
![clip_5](https://github.com/user-attachments/assets/6c115456-164b-468b-80ea-ff038489cf0c)

  
### 6. オプション  
  
もう一度  
設定 - システム - オプション機能  
を選択してください。  
WMICが追加中となっているはずです。  
  
![clip_6](https://github.com/user-attachments/assets/9585f5d1-8e09-4db9-a502-b180ca7ecf5d)

  
追加の完了までお待ちください。  
**結構時間がかかります。 ** 
  
### 7. 完了  
  
追加が完了すると、表示が追加済みになります。  
  
![clip_7](https://github.com/user-attachments/assets/51f09d39-a52c-4a76-ae44-c26b16929033)

  
### 8. 確認  
  
ターミナル(Power Shell)を開いて、wmicと入力してください。  
以下のように表示されたら、インストール成功です。  
  
![clip_8](https://github.com/user-attachments/assets/350be4e8-29b0-40fa-80ec-86d550b210a0)

  
  
以上  
