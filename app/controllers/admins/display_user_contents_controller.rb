class Admins::DisplayUserContentsController < ApplicationController
  include EditorHelper
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  
  def new
    @display_user_content = DisplayUserContent.new
  end

  def edit
  end

  def create
    @display_user_content = DisplayUserContent.new(content_params)

    respond_to do |format|
      if @display_user_content.save
        format.html { redirect_to @display_user_content, notice: '表示ユーザ詳細を更新しました' }
        format.json { render :show, status: :created, location: @display_user_content }
      else
        format.html { render :new }
        format.json { render json: @display_user_content.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_content
    @display_user_content = DisplayUserContent.find(params[:id])
  end

  def content_params
    params.require(:display_user_content).permit(
      :title,
      :body
    )
  end

end