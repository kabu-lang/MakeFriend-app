class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :area, :gender, :remarks, :image_name])
    end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private
      def sign_in_required
          redirect_to new_user_session_url unless user_signed_in?
      end
end
