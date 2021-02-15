module Services
  class Authentication
    attr_reader :token

    def initialize(email, password)
      @email    = email
      @password = password

      authenticate!
    end

    def success?
      @token.present?
    end

    private

    def authenticate!
      user = User.find_by(email: @email)

      @token = AppToken.create_for(user) if user && password_correct?(user.encrypted_password)
    end

    def password_correct?(password)
      BCrypt::Password.new(password) == @password
    end
  end
end
