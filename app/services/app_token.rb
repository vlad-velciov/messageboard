# frozen_string_literal: true

module Services
  class AppToken
    EXPIRATION = 3000
    ALGORITHM = 'HS256'

    attr_reader :timezone, :user_id, :email

    def initialize(payload, valid=true)
      @email    = payload['email']
      @user_id  = payload['user_id']
      @timezone = payload['timezone']
      @valid = valid
    end

    def self.from_token(token)
      decoded = JWT.decode(token, secret, true, {algorithm: 'HS256'}).first
      new(decoded)
    rescue JWT::DecodeError
      invalid_token
    end

    def self.create_for(user)
      now = Time.now
      expiration = (now + EXPIRATION).to_i

      payload = {
        email:    user.email,
        user_id:  user.id,
        timezone: user.timezone,
        exp:      expiration
      }

      JWT.encode(payload, secret, 'HS256')
    end

    def self.invalid_token
      new({}, false)
    end

    def valid?
      @valid
    end

    private

    def self.secret
      ENV['TOKEN_SECRET'] ||= 'foobar'
    end

  end
end
