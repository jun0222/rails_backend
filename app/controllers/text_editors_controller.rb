# frozen_string_literal: true

# テキストエディタ用のコントローラー
class TextEditorsController < ApplicationController
  before_action :set_text_editor, only: %i[show edit update destroy]

  def index
    @text_editors = TextEditor.order(updated_at: :desc)
  end

  def show; end

  def new
    @text_editor = TextEditor.new
  end

  def edit; end

  def create
    @text_editor = TextEditor.new(text_editor_params)

    if @text_editor.save
      redirect_to @text_editor, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @text_editor.update(text_editor_params)
      redirect_to @text_editor, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @text_editor.destroy
    redirect_to text_editors_path, notice: t('.success')
  end

  private

  def set_text_editor
    @text_editor = TextEditor.find(params[:id])
  end

  def text_editor_params
    params.require(:text_editor).permit(:content, :title)
  end
end
