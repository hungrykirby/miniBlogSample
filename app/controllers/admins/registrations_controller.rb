# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :need_admin_login, only: [:detail, :adminpage]
  # プロフィール画面用のアクションを追加
  def detail
    @admin = Admin.find_by(id: params[:id]) if current_admin.present?
  end
  
  def adminpage
    @admin = current_admin
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  #   redirect_to controller: 'blogs#index', status: 404
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    "/admin/#{current_admin.id}"
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def need_admin_login(alert_message = nil)
    unless admin_signed_in?
      if alert_message.blank?
        flash[:alert] = 'だめだよぉ、そんなことしちゃあ'
      else
        flash[:alert] = alert_message
      end
      redirect_to blogs_url
    end
  end

end
