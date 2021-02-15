# frozen_string_literal: true

module Endpoints
  class UserMessages < Grape::API

    params do
      requires :user_id, type: Integer, documentation: { in: 'url' }
    end
    get 'users/:user_id/messages' do
      #todo pagination ?

      reader = Services::MessageReader.new(params[:user_id], principal.timezone)
      messages = reader.read

      present messages, with: Entities::Message
    end

  end
end
