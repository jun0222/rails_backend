# frozen_string_literal: true

# アスキーアートを生成するコントローラ
class AaController < ApplicationController
  def index
    # indexアクションでは特にデータの処理を行わない
  end

  def show; end

  def create
    # フォームから送信されたテキストを受け取る
    text = params[:text]

    # artii gemを使ってアスキーアートを生成
    a = Artii::Base.new
    @aa = a.asciify(text)
    render :show
  end
end
