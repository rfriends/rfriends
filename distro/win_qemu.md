## Windows向けのqemu版rfriends3でラジオ録音   
  
qemu版rfriends3は、仮想環境で、イメージをダウンロードして実行するだけで、rfriends3が立ち上がります。  
より良い音を目指して、音のチューニングもしています。  
    
  
 現在、書きかけです。  
  
第1版　2026/07/27 new  
  
[!IMPORTANT]
> なお、現在は、テスト中なので、  使用結果を掲示板等で報告ができる方のみ使用してください。  
> 報告がむつかしい方は、正式リリースまでお待ちください。  

  
## １．環境  
  
以下のバージョンで確認しました。  
  
・Windows11 26H1(確認済)  
  
## ２．確認と設定  

qemuを実行にするには、以下の３つ機能が有効である必要があります。  
これは、一度設定すればよく、毎回の必要はありません。  
  
設定に不安がある方は、中止してください。  
  
### 2.1 BIOS/UEFIの仮想化機能  
  
PowerShellを管理者として実行し、
```
PS> (Get-WMIObject Win32_Processor).VirtualizationFirmwareEnabled
```  
True  
と表示されれば有効になっているので、次に進んでください。  
False   
と表示された場合は、PCを一度完全にシャットダウンし、  
起動時にF2やDeleteキーを連打してBIOS（UEFI）画面を開き、  
以下の項目を「Enabled」に変更する必要があります。  
  
Intel製CPUの場合: Intel Virtualization Technology や VT-x  
AMD製CPUの場合: SVM Mode や Secure Virtual Machine  
  
### 2.2 Windows ハイパーバイザー プラットフォーム     
  
PowerShellを管理者として実行し、
```
PS> Get-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform
```  
State : Enabled
と表示されれば有効になっているので、次に進んでください。  
State : Disabled  
と表示された場合は、以下を実行してください。  
```
PS> Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All
```
この操作を完了するために、今すぐコンピューターを再起動しますか?  
[Y] Yes  [N] No  [?] ヘルプ (既定値は "Y"):   
リターンキーを押して再起動してください。  
  
次の2.3の設定も行う場合は、ここでは再起動しなくてもかまいません。  
  
### 2.3 仮想マシン プラットフォーム  
  
PowerShellを管理者として実行し、
```
PS> Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```  
State : Enabled
と表示されれば有効になっているので、次に進んでください。  
State : Disabled  
と表示された場合は、以下を実行してください。  
```
PS> Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All  
```
この操作を完了するために、今すぐコンピューターを再起動しますか?  
[Y] Yes  [N] No  [?] ヘルプ (既定値は "Y"):  
リターンキーを押して再起動してください。  
  
## ３．qemu版rfriends3イメージのダウンロード（約1.2GB）    
  
ターミナルを開き、任意の場所に移動し実行してください。  
ここではc:\tempとしています。  
  
```  
PS> cd c:\temp
PS> wget http://rfbuddy.s296.xrea.com/storage/rfriends3_qemu_instwin.bat
PS> rfriends3_qemu_instwin.bat

Saving to: ‘rfriends3_qemu.zip’
rfriends3_qemu.zip 100%[==============================>]   1.13G  9.98MB/s    in 2m 1s
```  
  
ダウンロードが完了すると、自動的に解凍され、rfriends3_qemu ディレクトリができます。  
ディレクトリの中身は以下のとおり。  
```  
env.txt                 rfriends3_arm64.qcow2   run_rfriends3.bat
```
    
## ４．rfriends3の実行  
  　　
## 4.1 実行  
  
ターミナルを開き、rfriends3_qemu ディレクトリに移動し、 
rfriends3を実行します。  
 
```  
PS> cd c:\temp
PS> cd rfriends3_qemu
PS> run_rfriends3.bat  
```
    
以下のようなログイン画面になります。  
```    
Debian GNU/Linux 13 rfriends3-qemu ttyAMA0  
rfriends3-qemu login:   
```  
この時点ですでにrfriends3は起動しています。      
  
ブラウザで、http://localhost:8000 にアクセスして、以下のような画面が出たら成功です。    
  
他でポート8000で実行しているものがあると、失敗します。  
他を終了させるか、env.txtのポート設定を変更して、再度実行してください。   
unzip後のrfriends3_qemu.zipは不要です。削除してもかまいません。  
  
<img width="415" height="399" alt="clip_1" src="https://github.com/user-attachments/assets/04b24640-485e-404c-9bf5-7014d16bd8aa" />

   
「ヘルプ」「システム更新」でシステムを最新にしてください。  

[!CAUTION]
> 実行したターミナルを終了してしまうと、rfriends3も終了します。  
> ご注意ください。
 
  
## 4.2 終了    
  
・rfriends3の終了方法は2つあります。    
- user でログインし、sudo poweroff (安全)
- ctrl+a x  
  
## 4.3 ログインユーザ  
  
初期状態のログイン可能ユーザのパスワードは以下のとおり  
安全のため、パスワードは変更してください。 
  
- user / user  
- root / rfriends  
  
## 4.4 env.txt  
  
env.txtは実行環境設定です。  
ほとんど変更の必要はありません。  
変更する場合は、変更に失敗したときのためにバックアップをとってから行ってください。（自己責任）  
 
```
# env.txt
# 2026/07/25
#
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"  <-- env.txtがある場所
ARCH=$(uname -m)  <-- intel or silicon

IMG_FILE="${BASE_DIR}/rfriends3_${ARCH}.qcow2"  <-- ゲスト本体
ISO_FILE="${BASE_DIR}/debian-13.6.0-${ARCH}-netinst.iso"

SHARE_DIR="${BASE_DIR}/share"  <-- 録音データ

MEM_SIZE="2G" <-- メモリサイズ
CPU_CORES="2" <-- cpuコアの数
FREE_PAGE_REPORTING="off"

HOST_WEB_PORT="8000" <-- webのポート
HOST_SSH_PORT="2222" <-- sshのポート

# 現在、sambaは停止
#HOST_SMB_PORT="4445"
```
    
## 4.5 録音データ  
  
・録音データは、インストールしたrfriends3_qemuのshareフォルダ下にあります。  
```
rfriends3_qemu

% ls
env.txt
rfriends3_arm64.qcow2
run_rfriends3.sh
share　<-- これ

% ls share/usr2
kw              log             radiko          radiru_gogaku   timefree
kwbackup        podcast         radiru          radiru_vod      webradio
```
## 4.6 その他  
  
・インストール時は聴取（サーバ）では音がミュートになっています。  
 音量調整すれば、音が出るようになります。 
  
<img width="524" height="548" alt="clip_2" src="https://github.com/user-attachments/assets/d8e707d5-925c-4ba8-932c-0ffc80582b0a" />

   
## ５．rfriends3のアンインストール  
  
rfriends3を終了し、rfriends3_qemuフォルダを削除してください。  
アンインストールは終了です。  
  
アンインストールしても、録音データはホストのshareフォルダに残っています。 
  
以上  

