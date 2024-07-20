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
      redirect_to root_path, notice: "Text was successfully created."
    else
      render :new
    end
  end

  private

  def text_params
    params.require(:text).permit(:content)
  end
end