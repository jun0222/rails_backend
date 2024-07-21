## rubocop 導入

```bash
# Gemfileに追加
gem 'rubocop', require: false
gem 'rubocop-rails', require: false

# インストール
bundle install
```

## rubocop 設定

**.rubocop.yml**

```yaml
require: rubocop-rails

AllCops:
  NewCops: enable
  Exclude:
    - "db/schema.rb"
    - "bin/*"
    - "node_modules/**/*"

Rails:
  Enabled: true
```

**rubocop 実行**

```bash
# 全てのファイルをチェック
bundle exec rubocop

# 慎重な自動修正
bundle exec rubocop -a

# 自動修正
bundle exec rubocop -A
```

## このナレッジを書くタイミング

ビルド待ちなどに書けば良い。  
要点やコマンドだけで良い。  
copilot などの保管を 活用。

## 参考

- [rails チュートリアル](https://railstutorial.jp/chapters/beginning?version=7.0)

## コマンド

```bash
# 起動コマンド(環境変数でホストマシンがdotenvに勝たないようにする)
sh rails.sh

# マスターキーの存在確認
ls config/master.key

# credentials.yml.encを編集
EDITOR="code --wait" bin/rails credentials:edit
```

## gemfile の lock でデプロイエラー

```bash
validate_platforms!': Your bundle only supports platforms ["x86_64-darwin-22"] but your local platform is x86_64-linux. Add the current platform to the lockfile with bundle lock --add-platform x86_64-linuxand try again. (Bundler::ProductionError)
# 〜スタックトレース〜
load' from /opt/render/project/.gems/bin/bundle:25:in <main>' ==> Build failed 😞 ==> Common ways to troubleshoot your deploy: https://docs.render.com/troubleshooting-deploys
```

```bash
# lockファイルのLinuxプラットフォーム対応
bundle lock --add-platform x86_64-linux
```

## ローカル postgresql 設定時の history

```bash

# ローカルのpostgresに接続
docker ps | grep rails_backend
=> containerId   postgres:13       "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   5432/tcp                 rails_backend-db-1
docker exec -it containerId psql -U user -d db名

# ローカルのpostgresのみdockerで用意
touch docker-compose.yml
docker-compose up -d
brew install postgresql && bundle install
brew services list
brew services start postgresql

# 必要な環境変数をhostマシンに設定
export POSTGRES_USER=username
export POSTGRES_PASSWORD=password_text
export POSTGRES_HOST=0.0.0.0
export POSTGRES_DB=db_name

# railsのインストール。なぜかv指定なしでインストールできなかった
gem install rails -v 7.0.4.3
```

## docker 内の db にローカルから接続するとき

ローカルから docker の db に繋ぐにはポートフォワーディング必要。
docker-compose.yml に記述。

```yml
services:
  db:
    ports:
      - "5432:5432"
```

## ナレッジの残し方

history コマンド、ai chat、ソースの差分からナレッジをできるだけ書く。  
拾いきれなければ経験値だけ得て、次回同じことがあった時ナレッジにする。  
構造化を意識しすぎても読みにくいので、  
感覚的に md の h2 で小さく分ける。

検索性のために 1 ファイルに書く。

## ローカルで DB 接続できない

一つ一つ、必要な接続情報を考える。

- ポート
  - ポートフォワーディング
  - そもそも合っているか？
  - 他のコンテナで使っていないか？
- ユーザー名、パスワード
  - 環境変数などの設定ができているか？
  - コマンドラインから渡して動くか？

## ホストマシンの環境変数を取る方法

**docker-compose**

```yml
services:
  db:
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
```

**rails**

```ruby
# config/database.yml
default: &default
    adapter: postgresql
    encoding: unicode
    host: <%= ENV['POSTGRES_HOST'] %>
    username: <%= ENV['POSTGRES_USER'] %>
    password
    database: <%= ENV['POSTGRES_DB'] %>
```

## 基礎的な postgres コマンド

```bash
# データベース一覧
\l

# テーブル一覧
\dt

# テーブルの中身
SELECT * FROM table_name;
```

## bin/rails db:create でエラー

```bash
# すでにdbが存在する場合
PG::ConnectionBad: FATAL:  database "db_name" already exists
```

```bash
# dbを削除してから作り直す
bin/rails db:drop
bin/rails db:create

# dockerのpostgresに接続して削除
docker exec -it containerId psql -U user -d db_name(これから削除するdb以外)
DROP DATABASE db_name;
```
