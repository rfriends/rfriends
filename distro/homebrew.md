## Homebrewのインストール  
  
Homebrewは、macOS向けの「パッケージ管理システム」です。  
いかにインストール方法を記述します。    
  
### １）HomebrewのWebサイト（https://brew.sh/）を開き、インストールに表示されているコマンドをターミナルにCOPY&PASTEして実行する。  
  
2026/07/25 時点では以下のコマンドになっています。  
```  
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
```   
### ２）Homebrewのインストールが終了したら、念のためbrewを確認してください。  
```  
% brew doctor  
```  
Your system is ready to brew.  
  
と表示されたらインストールは成功です。  
  
### ３）もし、zsh: command not found: brew と表示されたら以下を実行してください。  
  
```  
% echo >> /Users/ユーザ名/.zprofile  
% echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ユーザ名/.zprofile  
% eval "$(/opt/homebrew/bin/brew shellenv)"  
% brew doctor  
Your system is ready to brew.  
```  
と表示されたらインストールは成功です。  
  
以上  
