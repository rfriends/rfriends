## RaspberryPi Imagerを使用してmicroSDを作成する。     
 
    
2026/08/20 改定  
      
   <https://www.raspberrypi.com/software/>  
  
![1](https://github.com/user-attachments/assets/de69af3e-f501-40e4-b387-3901962eaaaa)  
  
### １． Raspberry Pi デバイス  
  
インストールするラズベリーパイの機種を選択  
例 : Raspberry PI Zero 2 W
  
### ２． OS  
  
インストールするOSを選択する。  

> [!NOTE]
> ここでは32bit版を選択していますが、64bitが可能な機種は64bitを選択しても構いません。  
> また、メモリに余裕があれば、desktop版でもOK。     
  
Bookworm  
  
![3](https://github.com/user-attachments/assets/ca768534-6ea7-4dbe-b6d5-573911f705ae)  
  
Trixie  
  
![clip_3](https://github.com/user-attachments/assets/58299500-a77c-4236-af87-f0fbfddf0a8b)  
  
  
### ３． ストレージ  
  
セットしているmicroSDを選択  
  
> [!CAUTION]
> これを間違えると、ほかのデバイスにOSを書き込んでしまいます。
  
### ４． 設定を編集する  
  
・一般   
ホスト名、ユーザ名、SSID、パスワードは環境に合わせて設定する。    
ホスト名をユニークに設定しておくと、ホスト名でアクセスできるので便利です。
ここでは、rpi-1としています。  
  
![4](https://github.com/user-attachments/assets/1cbbfbe0-d869-486c-8f34-7bf8ad3b3609)
  
・サービス  
  
SSHを有効化する  
  
```

以上  
  
  
