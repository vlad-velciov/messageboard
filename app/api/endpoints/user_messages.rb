# frozen_string_literal: true

module Endpoints
  class UserMessages < ApplicationEndpoint

    desc 'Get unread messages for a user'
    params do
      requires :user_id, type: Integer, documentation: { in: 'url' }
    end
    get 'users/:user_id/messages' do
      messages = Services::MessageReader.call(params[:user_id], principal.timezone)

      present messages, with: Entities::Message, timezone: principal.timezone
    end

  end
end
