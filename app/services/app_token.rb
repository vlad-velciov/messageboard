module Services
  class AppToken
    EXPIRATION = 3000 # todo  what ?
    attr_reader :timezone, :user_id, :email

    def initialize(payload)
      @email    = payload['email']
      @user_id  = payload['user_id']
      @timezone = payload['timezone']
    end


    def self.from_token(token)
      decoded = JWT.decode(token, secret, true, {algorithm: 'HS256'}).first

      #todo error handling
      new(decoded)
    end

    def self.create_for(user)
      now = Time.now
      payload = {
        email:    user.email,
        user_id:  user.id,
        timezone: user.timezone,
        exp: (now + EXPIRATION).to_i
        # iss: ISSUER,
        # jti: SecureRandom.uuid,
        # iat: current_time.to_i
      }

      JWT.encode(payload, secret, 'HS256' )
    end

    def valid?
      true
    end

    def self.decode(token)
      JWT.decode(token, secret, algorithm: 'HS256')
    end

    def encoded
      JWT.encode(payload, secret)
    end

    private

    def self.secret
      ENV['TOKEN_SECRET'] ||= 'foobar'
    end

  end
end
