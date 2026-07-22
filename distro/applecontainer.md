## Apple Container版rfriends3でラジオ録音  
   
　ラジオ録音アプリrfriends3をApple Container環境で実行する方法について記述しています。  
  
初版 2026/07/21  
三版 2026/07/23  
  
> [!NOTE]  
> 現在、書きかけです。
  
  
## １．Apple Container環境構築   
  
### 1.1 インストール   
  
```
% brew install container

ロゼッタを使用しない設定
% mkdir -p ~/.config/container
% echo "[build]\nrosetta = false" >> ~/.config/container/config.toml
```  
### 1.2 確認  
```
% container --version
container CLI version 1.1.0 (build: release, commit: unspeci)

% container system start
% container run --rm hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

...（以下略）
```
   
## ２．実行  
  
イメージの作成から実行まではTerminal上で以下の操作を行ってください。  
 
### 2.1 スクリプトのダウンロード  
  
ここではホームディレクトリにしていますが、ダウンロードは任意の場所で可能です。  　　
```
% cd ~/  
% brew install git  
% rm -rf rfriends_docker  
% git clone https://github.com/rfriends/rfriends_docker.git  
```
 
### 2.2 uid,gidの変更をおこなう。  
  
Apple containerでは変更しないでください。    
  
### 2.3 イメージの作成および実行を行う。  
  
> [!NOTE]  
> コンテナ名やイメージ名を変更したい場合は、事前に.envファイルを編集してください。  
  
```
% cd rfriends_docker
% container system start  <-- system start 済の場合は不要
% sh run_apple_container.sh

rfriends3:latest
rf3-container 
```
  
と表示されたら成功です。 2.4に進んでください。
  
---  
もし、sh run_apple_container.shで以下のようなエラーが出たときは、ポート8000がすでに使用中です。
```
Error: failed to bootstrap container (cause: "internalError: "failed to bootstrap container rf3-container (cause: "unknown: "bind(descriptor:ptr:bytes:): Address already in use) (errno: 48)"")"")
```
  
以下のいずれかで対処し、再度 sh run_apple_container.sh を実行してください。  
  
1) .envファイルを編集して、コンテナ名、ポートを変更してください。（推奨）
```
例）
container_name=rf3-container2
http_port=8001  
```  
2) 現在のコンテナを停止
```
該当ポートを使用しているコンテナを見つける
% container ls
見つけたコンテナを停止
% container stop コンテナ
見つけたコンテナを削除
% container rm コンテナ
```
      
3) 以下のように、ポート8000を使っているPIDを終了させてください。
```
% lsof -i :8000
COMMAND   PID        USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
httpd   29193        user    4u  IPv6 0x9ea4c31e6c02d505      0t0  TCP *:irdmi (LISTEN)
...（以下略）

% kill -9 29193

% lsof -i :8000
何も出力されなければOK
```   
  
### 2.4 rfriends3にアクセスする  
  
ホスト側で以下を実行してください。  
```   
% hostname -I  
192.168.1.142 ..........  
```
  
ホストののIPアドレスが192.168.1.142の場合、ブラウザに
```
http://192.168.1.142:8000　または　http://localhost:8000
```
と入力するとrfriends3が表示されます。
ポート番号を変更している場合はその番号に。  
 
> [!TIP]   
> 同一LAN内の他のPCからもアクセスできます。
  
    
## ３．データ  
  
コンテナを終了させても、ホストのrfriends_dockerに録音データ、パラメータ設定が保存されています。  
  
rfriends_docker/share/smbdir/usr2  
rfriends_docker/share/rfriends3/config  

## ４．初期化  
  
もし、apple containerを　初期状態にしたいばあは以下の処理を行ってください。  
  
```
・コンテナの停止・削除
% container ls
表示されたコンテナを順次、停止・削除
buildkitはシステムで使用するコンテナ（削除しないほうがいい）
% container stop コンテナ
% container rm コンテナ
コンテナがないことを確認
% container ls

・イメージの削除
% container image ls
表示されたイメージを順次、削除
% container rm イメージ
イメージがないことを確認
% container ls

システムの停止
% container system stop
```
  
## ５．その他  
    
conatainer コマンド  
ほぼ、Docker toコマンドは同じですが、なぜか、ps が ls
```
システムステータス
% container system status
apiserver is not running and not registered with launchd

システム開始
% container system start 
Launching container-apiserver...
Testing access to container-apiserver...
Verifying machine API server is running...

システム停止
% container system stop 
2026-07-22T02:40:41+0900 info com.apple.container.cli: [ContainerCommands] checking if APIServer is alive
2026-07-22T02:40:41+0900 info com.apple.container.cli: stopTimeoutSeconds=5 [ContainerCommands] stopping containers
...(以下略)

Mac起動時に自動で常時起動させる
% brew services start container

コンテナリスト
% container ls
rf3-container   rfriends3:latest                                     linux  arm64  running  192.168.64.5/24  4     1024 MB  2026-07-20T15:03:28Z
buildkit        ghcr.io/apple/container-builder-shim/builder:0.12.0  linux  arm64  running  192.168.64.2/24  2     2048 MB  2026-07-20T14:52:00Z

コンテナ停止
% container stop rf3-container
rf3-container

コンテナ開始
% container start rf3-container
rf3-container

コンテナ削除
% container rm rf3-container
rf3-container

実行中のコンテナにログイン
% container exec -it rf3-container /bin/bash

イメージリスト
% container image ls
NAME         TAG     DIGEST
hello-world  latest  c3cbe1cc1aa5
ubuntu       24.04   4fbb8e6a8395
rfriends3    latest  7969fdf6758b

イメージ削除
% container image rm rfriends3
rfriends3:latest
```
  
## ５．おまけ  
  
なお、コンテナ版では、聴取は可能ですが、聴取（サーバ）は使用できません。  
どうしても使用したい方は、pulseaudioでのホスト連携処理を自己責任で追加してください。  
かなり面倒です。  
  
追加処理のヒント  
~~~
追加インストール
% brew install pulseaudio
  
pulse audio設定
% vi ~/.config/pulse/default.pa
load-module module-coreaudio-detect
load-module module-native-protocol-tcp auth-anonymous=1 port=4713

起動処理
% killall pulseaudio 2>/dev/null
% pulseaudio --load=module-coreaudio-detect --load=module-native-protocol-tcp="auth-anonymous=1 port=${pulse_port}" --exit-idle-time=-1 --daemon
% container run -e PULSE_SERVER=tcp:${host_ip_address}:${pulse_port} -e PULSE_SINK=${pulse_sink} ${image}

コンテナ内でのテスト
$ cat /dev/urandom | pacat --playback --server=tcp:192.168.1.18:4713 --device=1
~~~
  
以上  
  
  
  
