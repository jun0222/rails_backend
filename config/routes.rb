# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dummy_data/index'
  # rootで.envなど基礎的な機能の描画をテストする
  root 'home#routes'

  # ヘルスチェック
  get '/health_check', to: 'health_checks#index'

  # ダミーデータを生成する
  get 'dummy_data', to: 'dummy_data#index'

  # AAを生成する
  get 'aa', to: 'aa#index'
  post 'aa/create', to: 'aa#create'
  get 'aa/show', to: 'aa#show'

  # テキスト共有サービス
  resources :texts, only: %i[index new create destroy]

  # テキストエディタ
  resources :text_editors
end
