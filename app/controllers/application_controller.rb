class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    @user ||= current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name dob])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name dob])
  end
end
