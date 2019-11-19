class DisplayUsersController < ApplicationController
  include EditorHelper
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def index
    @display_users = DisplayUser.paginate(page: params[:page])
    @admin = current_admin
  end
  
  def new
    @display_user = DisplayUser.new
  end

  def edit
  end

  def show
    
    binding.pry
    
    @display_user_contents = nil
  end

  def create
    @display_user = DisplayUser.new(content_params)

    respond_to do |format|
      if @display_user.save
        # format.html { redirect_to @dis}
      end
    end
  end

  private

  def set_content
    @display_user = DisplayUser.find(params[:id])
  end
end