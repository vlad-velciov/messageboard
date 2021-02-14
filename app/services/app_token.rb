class AppToken

  def self.encode_for(user)
    payload = {
      email: user.email,
      user_id: user.id,
      timezone: user.timezone
    }

    JWT.encode(payload, secret)
  end

  def self.decode(token)
    JWT.decode(token, secret)
  end

  private

  def self.secret
    ENV['TOKEN_SECRET'] ||= 'foobar'
  end

end
