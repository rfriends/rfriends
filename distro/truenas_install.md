## TrueNASのインストール方法  
  
<img width="600" alt="clip_4" src="https://github.com/user-attachments/assets/47ffea38-893f-441c-87a3-1e70f339a245" />  
  
初版 2026/08/28  
  
なお、ここでは、簡単な説明にとどめます。  
詳しいサイトがたくさんあるので、そちらを参考にしてください。  
"truenas install"で検索すれば見つかります。  
  
### １．TrueNASのインストール  
  
#### 1) 使用しなくなったPC、USBメモリ(A)とUSBメモリ(B)を用意する。  
  
USBメモリは8GBくらいのもので十分。  
  
#### 2) TrueNASのサイトから最新のISOをダウンロードする。  
  
https://www.truenas.com/download/  
TrueNAS-SCALE-25.10.6.iso (2026/08/28現在)  
  
#### 3) ダウンロードしたISOをrufus等を使ってUSBメモリ(A)に書く。  
  
#### 4) USBメモリ(A)でブートする。  
  
#### 5) 別のUSBメモリ(B)を挿して、これにTrueNASをインストールする。  
  
truenas_adminのパスワードを設定する。  
ここでは仮に、truenas、とする。  
インストール終了まで、（かなり）しばらく待つ。  
  
余談ですが、こういう時、アクセスランプがあるUSBメモリのほうが安心ですね。  
  
The TrueNAS installation on sdx succeeded!  
と表示されたらインストール成功です。  
  
#### 6) PCをシャットダウンする。  
  
#### 7) USBメモリ(A)とUSBメモリ(B)を抜く。  
  
### ２．TrueNASの起動  
  
#### 1) 改めて、TrueNASをインストールしたUSBメモリ(B)のみを挿し、ブートする。  
  
#### 2) 自動で初期処理が開始されるので、以下の画面になるのを待つ。  
  
```  
Console setup  
-------------  
The web user interface is at:  
http://192.168.1.19  
（以下略）  
```  
  
このアドレスは例で使用環境で変わります。  
  
#### 3) TrueNASにログイン  
  
他PCのブラウザに、先ほどのアドレスを入力してください。  
ログイン画面が表示されます。  
  
<img width="600" alt="clip_3" src="https://github.com/user-attachments/assets/f31b8c71-1a12-4b2a-a920-72f9f187e5a3" />  
  
１．(5)で入力した情報でログインしてください。  
truenas_admin / truenas  
  
ここからは、このメニュー画面で各種設定をしていくことになります。  
  
以上  
