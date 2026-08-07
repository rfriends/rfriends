## Termuxのインストール方法  
  
Termuxは、AndroidやChrome OS上でLinux環境を実行できるターミナルエミュレータアプリです。  
ここでは、androidスマホ/タブレットにTermuxをインストールする方法について記述しています。    


   
  
> [!IMPORTANT]
> インストール時にセキュリティ関連のアラームが表示されますが、基本は許可で進めてください。気になる方はインストールを中止してください。  
  
初版：2021/01/19  
改版：2026/08/08
  
## １．準備  
  
以下のものが必要になります。  
  
androidスマートホンまたはタブレット(OS7以上)  
androidOS7未満では動作しません。  
    
## ２．Termuxのインストール   
  
現在、Termuxの入手方法は３つあります。  
  
1) [Github](https://github.com/termux/termux-app/releases)  
2) f-droid  
3) googleplay  
  
ただし、googlePlayから入手したTermuxでは、rfriends3は正常に動作しません。 
Githubからの入手を強くお勧めします。  
以下ではGithubからのインストール方法について記述しています。    
    
### 2.1 Termuxのダウンロード  
  
以下のリンクよりスマホのダウンロードディレクトリにtermuxをダウンロードしてください。  
アーキテクチャが不明の場合はuniversal版を選択してください。  
  
#### v0.119.0-beta.3 (android 7以上)  
  
universal(arm/aarch64)   
[universal](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.3/termux-app_v0.119.0-beta.3+apt-android-7-github-debug_universal.apk)  
  
aarch64  
[arm64-v8a](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.3/termux-app_v0.119.0-beta.3+apt-android-7-github-debug_arm64-v8a.apk)  
  
arm  
[armeabi-v7a](https://github.com/termux/termux-app/releases/download/v0.119.0-beta.3/termux-app_v0.119.0-beta.3+apt-android-7-github-debug_armeabi-v7a.apk)  
    
### 2.2 Termuxのインストール  
  
1) ファイルマネージャを起動し、ダウンロードディレクトリにあるcom.termux_1020.apkをタップしてtermuxをインストールしてください。  
   
![1](https://github.com/user-attachments/assets/cde2403e-6c3a-49dc-9ea8-b38e3ab05249)  

2) "詳細"を押して下さい。（androidのバージョンにより画面は異なります）  
  
![2](https://github.com/user-attachments/assets/6581f35d-fb4f-4098-9481-81aff365e414)  
  
3) "インストールする"を押してください。 
  
![3](https://github.com/user-attachments/assets/f3087eb2-28e4-45c2-8ab1-754dab5fd244)  
  
4) このような画面が出たら、**必ず** "許可"を押してください。
  
![4](https://github.com/user-attachments/assets/348b495f-60ba-43b9-b79c-9d3b7f8a3dfe)  
  
5) これでtermuxのインストールは完了です。
  
![4a](https://github.com/user-attachments/assets/0166b778-e8af-4e36-908c-874d42435f0d)  
  
## ３．Termuxのセットアップ   
  
セットアップで必ず実行することは2つあります。  
  
#### 3.1 termuxのミラーサイトを変更する。   
  
以下を入力してください。  
  
```  
$ termux-change-repo
```  
  

ミラーをグループにするかシングルにするかの選択画面が出ますが、そのままOKを選択してください。  
  
![6](https://github.com/user-attachments/assets/5b1d1d3b-7d0b-40d1-afcf-30b2df66c927)  
  
ミラーグループの選択画面が出ますが、~~そのままOKを選択してください。~~   
訂正）Mirrors in Asia All in Asia (excl. Chinese) の方を選択してください。(このほうが速い)
  
![7](https://github.com/user-attachments/assets/ff6f0023-6942-4283-bb4e-6c1db1354fbb)  
  
> [!CAUTION]  
> その後、ミラーサイトのチェックが行われますが  
> Error: None of mirrors are accessable  
> のようなメッセージが出た場合はミラーサイトがすべてダウンしているので、  
> しばらく時間を置いて再度termux-change-repoを実行してく
ださい。  
>   

#### 3.1 termuxのstorageをセットアップする。   
  
以下を入力してください。  
  
```  
$ termux-setup-storage  
```  
  
全てのファイルの管理権を付与する。  
  
![5](https://github.com/user-attachments/assets/e9232282-ed0f-43af-8bc8-4ae552fc3c9f)  
  
これにより、termuxからandroid側のファイルにアクセスできるようになります。

```  
$ cd  　
$ cd storage　　
~/storage $ ls　　
audiobooks  dcim  documents  downloads  external-0  media-0  movies  music  pictures  podcasts  shared　　
```  
  
  
以上  
  
