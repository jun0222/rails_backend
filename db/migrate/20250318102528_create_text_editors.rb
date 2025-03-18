# frozen_string_literal: true

# テキストエディタ用のマイグレーションファイル
class CreateTextEditors < ActiveRecord::Migration[7.0]
  def change
    create_table :text_editors do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
