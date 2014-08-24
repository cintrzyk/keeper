class SignUserIn
  attr_reader :user, :session

  def initialize(session, user)
    @session = session
    @user = user
  end

  def commence!
    user.persisted? || save_user!
    session[:user_id] = user.id
  end

  def save_user!
    user.save!
  end
end
