## 参考

- [rails チュートリアル](https://railstutorial.jp/chapters/beginning?version=7.0)

## コマンド

```bash
# マスターキーの存在確認
ls config/master.key

# credentials.yml.encを編集
EDITOR="code --wait" bin/rails credentials:edit
```

## gemfile のロックでデプロイエラー

```bash
validate_platforms!': Your bundle only supports platforms ["x86_64-darwin-22"] but your local platform is x86_64-linux. Add the current platform to the lockfile with bundle lock --add-platform x86_64-linuxand try again. (Bundler::ProductionError)
# 〜スタックトレース〜
load' from /opt/render/project/.gems/bin/bundle:25:in <main>' ==> Build failed 😞 ==> Common ways to troubleshoot your deploy: https://docs.render.com/troubleshooting-deploys
```

```bash
# lockファイルのLinuxプラットフォーム対応
bundle lock --add-platform x86_64-linux
```
