## Windows11 24h2用 wmicのインストール方法について  
  
rfriends3では、録音状況の表示にwmicコマンドを使用しています。  
  
![1](https://github.com/user-attachments/assets/e5471666-2618-4166-8a5a-0d44ba2bfd91)



ところがWindows11 24h2から標準ではwmicが使えなくなってしまいました。  
前バージョンからのアップデートは使えるらしい。  
  
とはいえ、現状使えないと困るので、インストールの方法を記述します。  
  
### 1. 現状の確認  
  
ターミナル(Power Shell)を開いて、wmicと入力してください。  
以下のように表示されたら、使えないので次に進んでください。  
  
![2](https://github.com/user-attachments/assets/f1e85a04-14c1-4b4b-b64e-c224ec3d8aaf)

  
### 2. オプション  
  
設定 - システム - オプション機能  
を選択してください。  
  
![3](https://github.com/user-attachments/assets/498dcf3d-0d2e-4035-8920-86ffb509cde2)

  
### 3. 機能表示  
  
オプション機能の「機能を表示」を選択してください。  
  
![4](https://github.com/user-attachments/assets/f92747f7-8690-4bf4-9376-3cc44e867c5d)

  
### 4. WMIC  
  
「WMIC」をチェックして、「次へ」を選択してください。  
  
![5](https://github.com/user-attachments/assets/b9926ab3-067a-456d-8bb1-b4b5e8e63505)

  
### 5. 追加  
  
「追加」を選択してください。  
  
![6](https://github.com/user-attachments/assets/f88bdaa3-6e9e-412a-9135-d71088dc1e22)

  
### 6. オプション  
  
もう一度  
設定 - システム - オプション機能  
を選択してください。  
WMICが追加中となっているはずです。  
  
![7](https://github.com/user-attachments/assets/9900ad6b-9711-4afe-b1f5-088806426a1d)

  
追加の完了までお待ちください。  
**結構時間がかかります。 ** 
  
### 7. 完了  
  
追加が完了すると、表示が追加済みになります。  
  
![8](https://github.com/user-attachments/assets/673b4258-4d6e-4039-9ad4-a554aa4bf162)

  
### 8. 確認  
  
ターミナル(Power Shell)を開いて、wmicと入力してください。  
以下のように表示されたら、インストール成功です。  
  
![9](https://github.com/user-attachments/assets/2527338c-e52a-4a9a-9ef7-d0003bacb305)

  
  
以上  
