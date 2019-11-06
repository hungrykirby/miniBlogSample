class BlogsController < ApplicationController
  include EditorHelper
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # before_action :need_admin_login, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.paginate(page: params[:page])
    @admin = current_admin
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    # need_admin_login
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def need_admin_login(alert_message = nil)
      unless admin_signed_in?
        if alert_message.blank?
          flash[:alert] = 'だめだよぉ、そんなことしちゃあ'
        else
          flash[:alert] = alert_message
        end
        # redirect_to blogs_url
      end
    end
end
