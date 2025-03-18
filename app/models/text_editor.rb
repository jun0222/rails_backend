# frozen_string_literal: true

# テキストエディタ用のモデル
class TextEditor < ApplicationRecord
  validates :content, presence: true
end
