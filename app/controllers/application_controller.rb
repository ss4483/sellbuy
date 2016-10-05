class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:category, :career, :talk_name, :nickname, :profile, :kind, :name, :phone_num, :facebook_url, :instar_url, :twitter_url, :blog_url, :date_of_birth, :gender, :location, :email, :password) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:category, :career, :talk_name, :nickname, :profile, :kind, :name, :phone_num, :facebook_url, :instar_url, :twitter_url, :blog_url, :date_of_birth, :gender, :location, :password, :current_password) }
      end
end
