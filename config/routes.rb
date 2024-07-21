# frozen_string_literal: true

Rails.application.routes.draw do
  # rootで.envなど基礎的な機能の描画をテストする
  root 'home#index'

  # ヘルスチェック
  get '/health_check', to: 'health_checks#index'

  # テキスト共有サービス
  resources :texts, only: %i[index new create]
end
