## Termux版でのsambaアクセス　    
  
Termux版の時のsambaアクセスの方法。  
 
初版：2026/08/21  
   
  
sambaはポート4445で実行されています。  
IPアドレスを192.168.1.51として記述しています。  
  
#### 1) Linuxの場合  
  
アクセサリー - ファイル - 他の場所  
  
```  
smb://192.168.1.51:4445/smbdir/  
```  
  
接続  
  
#### 2) Androidの場合  
  
Owlfilesアプリはポートを変更できます。  
他にもファイルマネージャ＋、AndSMBで接続できました。  
  
![Screenshot_20260205-182120](https://github.com/user-attachments/assets/07be459c-08ef-4f30-a399-4500a67bbdd4)

  
右上の雷マーク - 新しい接続 - NAS  
  
![Screenshot_20260205-182102](https://github.com/user-attachments/assets/71711692-0fa1-4020-84df-ac23b0b1ff37)


  
保存（フロッピーアイコン）  
  
#### 3) Windowsの場合  
  
基本ポート445以外は接続できませんが、  
Windows11 24H2から代替ポートが指定出来るようになりました。  
  
PowerShell(管理者）を起動し、  
  
```  
PS > New-SmbMapping -LocalPath X: -RemotePath \\192.168.1.51\smbdir -TcpPort 4445 -password ******* -user termux

Status Local Path Remote Path
------ ---------- -----------
OK     X:         \\192.168.1.51\smbdir

PS C:\Users\user> x:
PS X:\> dir
```
  
これでドライブXで接続可能です。  
-LocalPath X: は、なくてもかまいません。  
  
また、エクスプローラから  
```
\\192.168.1.51/smbdir  
```
でアクセスできます。  
  
ステータスを見るには、    
```  
PS > Get-SmbMapping  
  
Status Local Path Remote Path  
------ ---------- -----------  
OK     X:         \\192.168.1.51\smbdir  
```  
また、接続を解除するには、  
```  
PS > Remove-SmbMapping -LocalPath X:  
  
確認  
この操作を実行しますか?  
ターゲット 'Close-Connection' で操作 'X:,\\192.168.1.51\smbdir' を実行しています。  
[Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "Y"):  
```  
  
#### 4) sambaディレクトリ  
  
sambaディレクトリは以下のファイルのpathを編集することにより変更できます。  
  
$ vi $PREFIX/etc/smb.conf  
  
```  
[smbdir]  
comment = termux share folder for rfriends  
path = /data/data/com.termux/files/home/storage/downloads/usr2/  
read only = no  
browsable = yes  
guest ok = yes  
force user = termux  
```  
  
編集後、サービスの再起動を行ってください。  
  
$ smbd -D -s $PREFIX/etc/smb.conf  
  

    
以上    
  
  
