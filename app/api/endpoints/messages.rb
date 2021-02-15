# frozen_string_literal: true

module Endpoints
  class Messages < ApplicationEndpoint
    namespace :messages do
      params do
        requires :receiver_ids, type: Array, documentation: { in: 'body' }
        requires :sender_id, type: Integer, documentation: { in: 'body' }
        requires :message, type: String, documentation: { in: 'body' }
      end
      post do
        sender = Services::MessageSender.new(params[:sender_id], params[:receiver_ids], params[:message])
        message = sender.call

        present message
      end

    end
  end
end
