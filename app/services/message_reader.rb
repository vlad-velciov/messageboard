module Services

  class MessageReader
    extend ApplicationService

    def initialize(user_id, timezone)
      @user_id = user_id
      @timezone = timezone
    end

    def read
      messages = user.unread_messages
    end

    private

    def user
      @user ||= User.find @user_id
    end
  end
end
