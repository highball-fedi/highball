# ソースコードをビルドする
## 要件
1. [Free Pascal](https://freepascal.org)
2. 以下のPOSIX環境が推奨されています。[^1]
    1. NetBSD/amd64
    2. Debian GNU/Linux 12
3. [PostgreSQL](https://www.postgresql.org) または [SQLite](https://www.sqlite.org)

## ビルド方法
1. [リポジトリ](https://github.com/highball-fedi/highball)[^2] をクローンします。
2. `config.default` を `config` としてコピーします。
3. `config` を必要に応じて調整します。[^3]
4. `make` を実行します。

[^1]: [Cygwin](https://www.cygwin.com)/[MSYS2](https://www.msys2.org)/[w64devkit](https://github.com/skeeto/w64devkit)でも動作するかもしれません。
[^2]: ミラーやフォークがあるかもしれませんが、このリポジトリを推奨します。
[^3]: [コンパイル時の設定の調整](../config-jp)を参照してください。
