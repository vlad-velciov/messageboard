module Services
  class Registration

    def initialize(email, password, timezone)
      @email = email
      @password = password
      @timezone = timezone
    end

    def call
      User.create!(email: @email, encrypted_password: encrypted_password, timezone: @timezone)
    end

    private

    def encrypted_password
      BCrypt::Password.create(@password)
    end
  end
end
