class UserFromAuth
  attr_reader :auth

  def initialize(auth)
    @auth = auth
  end

  def build
    User.new do |u|
      u.email = email
      u.uid = uid
      u.provider = provider
      u.image = image
    end
  end

  def find
    User.find_by uid: uid, provider: provider
  end

  def find_or_build
    find || build
  end

  private

  def uid
    auth[:uid]
  end

  def provider
    auth[:provider]
  end

  def info
    @info ||= auth.fetch 'info', {}
  end

  def email
    info[:email]
  end

  def image
    URI.parse info[:image]
  end
end
