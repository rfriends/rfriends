## Volumio4のインストール方法  
  
Raspberry PiにVolumio4をインストールする方法について記述しています。  
  
初版 2026/08/15  
  
### １．概要  
  
・Raspberry Pi 2  
・有線LAN  
・USB-DAC  
  
インストールし、音が出て、SSH接続ができるまで。  
  
### ２．インストール  
  
#### 2.1 イメージのダウンロード  
  
Volumio の公式サイトより、イメージをダウンロードする。  
  
<img width="832" height="580" alt="clip_2" src="https://github.com/user-attachments/assets/413f92c4-394f-48d8-9512-e33fadb26679" />
  
2026/08/15現在、  
Volumio-4.119-2026-03-24-pi.zip  
  
#### 2.2 MicroSDにイメージを焼く  
  
ツールを起動し、ダウンロードしたイメージを焼く。  
ここではrufusを使用。  
  
<img width="434" height="543" alt="clip_4" src="https://github.com/user-attachments/assets/19945b07-98bf-4839-93f3-6e40e962213d" />
  
選択をクリックし、先ほどのイメージを選択する。  
  
<img width="832" height="355" alt="clip_3" src="https://github.com/user-attachments/assets/eebdac68-7375-49a8-a917-de3375dde7ef" />

  
#### 2.3 Volumioの起動  
  
microSDをRaspberryPiに挿入し、電源を入れる。  
この時、USB-DAC、スピーカも接続しておく。  
  
初回は、領域拡張処理が走るので、終了まで気長に待つ。  
  
#### 2.4 Volumioの設定  
  
ブラウザに、volumio.localと入力すると以下のような画面になる。  
  
<img width="832" height="580" alt="clip_6" src="https://github.com/user-attachments/assets/8a227125-3237-4f40-ab74-5b7e1ae7ea54" />
  

あとは、基本「次へ」を選択すれば、処理は進む。  
以下の画面が出れば、完了です。  

<img width="832" height="580" alt="clip_13" src="https://github.com/user-attachments/assets/3e814b4b-9260-434e-bd1b-952c763c049e" />

「完了」を押すと、チュートリアルが走るので、「X」を押して終了してもかまいません。  

<img width="832" height="580" alt="clip_15" src="https://github.com/user-attachments/assets/0d716e9c-e585-4334-b2c7-67dc07ae1fca" />
  
### ３．IPアドレスの確認  
  
volumioが1台の時は、volumio.localで基本的には困りませんが、一応IPアドレスを確認。  
トップ画面より、ネットワーク設定を選択する。 
  
<img width="832" height="580" alt="clip_17" src="https://github.com/user-attachments/assets/67b70df8-b089-44aa-8489-58cd315dcda9" />
  
ここに表示されたIPアドレスを控えておいてください。  
  
<img width="832" height="580" alt="clip_18" src="https://github.com/user-attachments/assets/93a92699-8cf6-4653-b8ca-7c5c90a42091" />
  
  
### ４．音のテスト  
  
接続した、USB-DAC経由で音が出るかを確認する。  
トップ画面より、再生設定を選択する。 
　　
<img width="832" height="580" alt="clip_19" src="https://github.com/user-attachments/assets/71e208e5-5776-440b-921b-6d1210a22f94" />

USB_DACを選択し、保存する。  

トップ画面より、ウェブラジオを選択し、適当な局を再生する。  
   
<img width="832" height="580" alt="clip_25" src="https://github.com/user-attachments/assets/1bb2b9c6-a6bd-4d90-9189-d93657ec94b1" />

スピーカより音が出ればOK。  
  
### ５．SSH接続のテスト  

  
Windowsの場合、ターミナルを起動し  
  
PS> ssh voklumio@volumio.local  
  
と入力する。  
  
次に、yes  
次に、パスワード（初期値はvolumio）  
を入力すれば、以下のような画面になる。  
  
<img width="826" height="590" alt="clip_26" src="https://github.com/user-attachments/assets/8a2826f5-e1e4-4c4e-9094-c089f321028e" />
  
  
### ６．その他  
  
以上で説明は終了。  
詳細な設定は、他のサイトを参考に。  
  
以上  
  
