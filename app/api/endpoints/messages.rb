# frozen_string_literal: true

module Endpoints
  class Messages < ApplicationEndpoint
    namespace :messages do

      desc 'Send a message to users'
      params do
        requires :receiver_ids, type: Array, documentation: { in: 'body' }
        requires :sender_id, type: Integer, documentation: { in: 'body' }
        requires :message, type: String, documentation: { in: 'body' }
      end
      post do
        message = Services::MessageSender.call(params[:sender_id], params[:receiver_ids], params[:message])

        present message
      end

    end
  end
end
