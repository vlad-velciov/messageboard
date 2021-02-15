# frozen_string_literal: true

module Services

  class MessageSender
    extend ApplicationService

    def initialize(sender_id, receiver_ids, message)
      @sender_id = sender_id
      @receiver_ids = receiver_ids
      @message = message
    end

    def call
      message = Message.create(sender_id: @sender_id, message: @message)
      users = User.where(id: @receiver_ids).all

      message.receivers = users
      message
    end

  end
end
