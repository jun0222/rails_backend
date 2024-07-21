# frozen_string_literal: true

# テキスト共有機能のモデル
class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :texts, id: :uuid do |t|
      t.text :content

      t.timestamps
    end
  end
end
