# frozen_string_literal: true

# テキスト共有用のコントローラー
class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def text_params
    params.require(:text).permit(:content)
  end
end
