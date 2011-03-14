class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user
  helper_method :auth_user
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def auth_user
    unless current_user
      redirect_to ask_login_url
    end
  end
  
end
