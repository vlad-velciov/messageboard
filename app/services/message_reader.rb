# frozen_string_literal: true

module Services

  class MessageReader
    extend ApplicationService

    def initialize(user_id, timezone)
      @user_id = user_id
      @timezone = timezone
    end

    def call
      messages = user.unread_messages.to_a
      user.unread_message_notifications.update(read: true)

      messages
    rescue ActiveRecord::RecordNotFound
      []
    end

    private

    def user
      @user ||= User.find @user_id
    end
  end
end
