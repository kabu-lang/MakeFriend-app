class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# ログイン済ユーザーのみにアクセスを許可
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      users_show_path # サインイン後に遷移するpathを設定
    end

    def after_sign_up_path_for(resource)
    edit_user_registration_path # サインアップ後に遷移するpathを設定
    end


  protected
  def configure_permitted_parameters
    # サインアップ時 ストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    # アカウント編集時 ストロングパラメータ
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender, :area, :remarks])
  end

end
