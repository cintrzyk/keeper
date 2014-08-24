class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :signup_required

  helper_method :signed_in?, :current_user

  def signed_in?
    current_user.present?
  end

  def current_user
    return @current_user if defined? @current_user
    get_current_user
  end

  private

  def signup_required
    signed_in? || redirect_to(root_path)
  end

  def get_current_user
    if session[:user_id] && user = User.find_by(id: session[:user_id])
      @current_user ||= user
    end
  end
end
