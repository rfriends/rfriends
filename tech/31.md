## Windowsの仮想化を有効にする

wslやqemuなどを実行するには、以下の機能が有効である必要があります。  
これは、一度設定すればよく、毎回の必要はありません。  
  
設定に不安がある方は、中止してください。  
  
### １．BIOS/UEFIの仮想化機能  
  
タスクマネージャのCPUの項目を開き、仮想化が有効になっていたら、次に進んでください。
<img width="634" height="349" alt="clip_4" src="https://github.com/user-attachments/assets/5c17817f-91f5-4ef5-8b3e-241473021d41" />

無効の場合は、PCを一度完全にシャットダウンし、  
起動時にF2やDeleteキーを連打してBIOS（UEFI）画面を開き、  
以下の項目を「Enabled」に変更する必要があります。  
  
Intel製CPUの場合: Intel Virtualization Technology や VT-x  
AMD製CPUの場合: SVM Mode や Secure Virtual Machine  
  
### ２． Windows の機能      
  
スタートボタンの横にある検索バーに「Windows の機能」と入力します。  
[Windows の機能の有効化または無効化] を開きます。  
  
「Windows ハイパーバイザー プラットフォーム」    
「仮想マシン プラットフォーム」または「Virtual Machine Platform」    
をチェックし、有効にします。  
  
<img width="415" height="467" alt="clip_5" src="https://github.com/user-attachments/assets/94c01820-3925-4fd1-9441-3a54ac751e96" />

[OK] を押したあと、PCを再起動してください。  
  
以上  
