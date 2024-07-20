#!/bin/bash

# .env ファイルのパスを指定
dotenv_path="./.env.development"

# .env ファイルが存在するか確認
if [ ! -f "$dotenv_path" ]; then
    echo ".env file not found"
    exit 1
fi

# .env ファイルから環境変数を読み込み、エクスポートする
echo "=============================="
while IFS='=' read -r key value
do
  # 空行またはコメント行をスキップ
  [[ "$key" =~ ^#.*$ ]] || [[ -z "$key" ]] && continue
  # 環境変数をエクスポート
  export "$key=$value"
  echo "export $key=$value"
done < "$dotenv_path"
echo "Environment variables are set."
echo "=============================="

# アプリケーションの起動コマンド
bin/rails server