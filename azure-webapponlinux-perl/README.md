# Perlコンテナ for Azure Webapp on Linux
開発はローカルDocker、本番はAzure Webapp on Linuxで使うことを想定

## 説明

### Dockerfile_base
アプリコンテナのベースとなるコンテナ。Azure Webapp on Linuxで使うための設定とか入ってる。cpanのインストールなどはONBUILDでアプリコンテナ側で行うように設定。

### Dockerfile
アプリコンテナ。Perl動かすだけならFROM以外書く必要なし。

### init.sh (init_dev.sh, init_prod.sh ...)
アプリの起動スクリプト。APPENVがPRODであればinit_prod.shを呼ぶような処理が入っているが、まぁ好きにいじる。

### sshd_config
Azureの公式で配布しているsshd_config。Azure Webapp on LinuxでSSH接続するときに必要。deprecatedなオプションは消してある。

## 問題点

- Azure Webapp on Linuxでhypnotoadをそのまま使うと落ちる
どうもプロセス数の問題があるっぽいが、まだ検証できていない。

- ソースコードが即時反映されない問題
Azure Webapp on LinuxでFTPでソースコードを更新しても、即時にコンテナへ反映されない。そのため、現状ではコンテナ側にソースコードを入れて更新しちゃうのが良いのかも(でもそれだとAppServiceの楽さが失われる)。