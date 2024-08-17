# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dummy_data/index'
  # rootで.envなど基礎的な機能の描画をテストする
  root 'home#index'

  # ヘルスチェック
  get '/health_check', to: 'health_checks#index'

  get 'dummy_data', to: 'dummy_data#index'

  # テキスト共有サービス
  resources :texts, only: %i[index new create]
end
