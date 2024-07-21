# frozen_string_literal: true

# ヘルスチェック用のコントローラ
class HealthChecksController < ApplicationController
  # 認証をスキップする場合（API等）
  # skip_before_action :verify_authenticity_token, only: [:index]

  def index
    render plain: 'OK', status: :ok
  end
end
