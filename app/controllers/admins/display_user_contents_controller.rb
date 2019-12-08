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
        # format.html { redirect_to @dis}
      end
    end
  end
end