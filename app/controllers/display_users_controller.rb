class DisplayUsersController < ApplicationController
  include EditorHelper
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :edit, :update, :destroy]

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
   @display_user_contents = nil
  end

  def create
    @display_user = DisplayUser.new(display_user_params)

    respond_to do |format|
      if @display_user.save
        format.html { redirect_to @display_user, notice: 'woow' }
        format.json { render :show, status: :created, location: @display_user }
      else
        format.html { render :new }
        format.json { render json: @display_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_content
    @display_user = DisplayUser.find(params[:id])
  end

  def display_user_params
    params.require(:display_user).permit(
      :name,
      :kana,
      :email
    )
  end
end