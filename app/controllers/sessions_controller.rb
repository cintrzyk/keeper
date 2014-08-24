class SessionsController < ApplicationController
  skip_before_action :signup_required, only: [:create, :failure]

  def create
    sign_user_in
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

  def failure
    redirect_to root_path, notice: 'Please try again later.'
  end

  private

  def auth_hash
    request.env['omniauth.auth'].with_indifferent_access
  end

  def user_from_auth
    UserFromAuth.new(auth_hash).find_or_build
  end

  def sign_user_in
    SignUserIn.new(session, user_from_auth).commence!
  end
end
