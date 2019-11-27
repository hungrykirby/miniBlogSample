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
    @int_fields = display_user_int_fields
    @text_fields = display_user_text_fields
    @text_area_fields = display_user_text_area_fields
    @checkbox_fields = display_user_checkbox_fields
  end

  def show
   @display_user_contents = @display_user.display_user_contents
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

  def update
    respond_to do |format|
      if @display_user.update(display_user_params)
        format.html { redirect_to @display_user, notice: 'DU was successfully updated.' }
        format.json { render :show, status: :ok, location: @display_user }
      else
        format.html { render :edit }
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
      :name, :kana, :description, :email, :sex, :age, :sort_num, :show_at_top_flag
    )
  end

  def display_user_text_fields
    [
      :name, :kana, :email
    ]
  end

  def display_user_int_fields
    [:sort_num, :age]
  end

  def display_user_text_area_fields
    [:description]
  end

  def display_user_checkbox_fields
    [:show_at_top_flag]
  end
end