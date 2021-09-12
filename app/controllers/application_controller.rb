class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :full_width_first_name, :full_width_last_name, :first_name_kana, :last_name_kana, :birthday])
  end

  def sign_up_params
    params.permit(:nic_kname, :full_width_first_name, :last_name_kana, :first_name_kana)
  end



  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
    end
  end


end
