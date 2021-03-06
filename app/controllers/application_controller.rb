class ApplicationController < ActionController::Base
  include EditorHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def after_sign_in_path_for(_resource)
    '/adminpage'
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
