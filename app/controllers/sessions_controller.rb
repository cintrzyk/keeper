class SessionsController < ApplicationController
  def create
    sign_user_in
    redirect_to root_path
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
