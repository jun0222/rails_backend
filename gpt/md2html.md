Rails を使って、Markdown ファイルをアップロードし、HTML に変換して返すアプリケーションを作成する手順を説明します。

### 1. Rails プロジェクトの作成

まず、新しい Rails プロジェクトを作成します。

```bash
rails new markdown_to_html
cd markdown_to_html
```

### 2. コントローラとビューの作成

Markdown ファイルをアップロードするフォームと、HTML を表示するためのコントローラとビューを作成します。

```bash
rails generate controller Markdown convert show
```

このコマンドで、`app/controllers/markdown_controller.rb` が生成されます。

### 3. 必要な Gem を追加

`Gemfile`に以下の行を追加し、Markdown を HTML に変換するための `redcarpet` をインストールします。

```ruby
gem 'redcarpet'
```

次に、`bundle install` を実行してインストールします。

```bash
bundle install
```

### 4. コントローラの実装

`app/controllers/markdown_controller.rb` を以下のように編集します。

```ruby
class MarkdownController < ApplicationController
  require 'redcarpet'

  def show
  end

  def convert
    if params[:file].present?
      markdown_content = params[:file].read
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @html_content = markdown.render(markdown_content)
      render :show
    else
      flash[:alert] = "ファイルを選択してください。"
      redirect_to root_path
    end
  end
end
```

### 5. ルートの設定

`config/routes.rb` を以下のように編集します。

```ruby
Rails.application.routes.draw do
  root 'markdown#show'
  post 'convert', to: 'markdown#convert'
end
```

### 6. ビューの作成

`app/views/markdown/show.html.erb` を以下のように編集します。

```erb
<h1>Markdown to HTML Converter</h1>

<%= form_with url: convert_path, local: true, multipart: true do |form| %>
  <div class="field">
    <%= form.label :file, "Upload your Markdown file" %><br>
    <%= form.file_field :file %>
  </div>
  <div class="actions">
    <%= form.submit "Convert to HTML" %>
  </div>
<% end %>

<% if @html_content.present? %>
  <h2>Converted HTML</h2>
  <div style="border: 1px solid #ccc; padding: 10px;">
    <%= @html_content.html_safe %>
  </div>
<% end %>
```

### 7. アプリケーションの実行

`rails server` を実行して、アプリケーションを起動します。

```bash
rails server
```

ブラウザで `http://localhost:3000` にアクセスし、Markdown ファイルをアップロードして HTML に変換された結果を表示できます。

この基本的なアプリケーションでは、Markdown ファイルをアップロードし、その内容を HTML に変換して表示する機能が実装されています。必要に応じて、CSS を追加して HTML のスタイルを調整したり、エラーハンドリングを強化したりできます。
