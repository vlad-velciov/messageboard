module Endpoints
  class Messages < Grape::API

    namespace :messages do

      params do
        requires :receiver_ids, type: Array, documentation: { in: 'body' }
        requires :sender_id, type: Numeric, documentation: { in: 'body' }
        requires :message, type: String, documentation: { in: 'body' }
      end
      post do
        sender = MessageSender.new(params)
        message = sender.send

        present message
      end

      params do
        requires :user_id, type: Numeric, documentation: { in: 'body' }
        requires :message_id, type: String, documentation: { in: 'body' }
        requires :timezone, type: String, documentation: { in: 'body' }
      end
      get do
        messages = MessageReader.new(params)

        present messages, with Entities::Message
      end

    end
  end
end
