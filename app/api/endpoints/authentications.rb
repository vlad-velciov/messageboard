# frozen_string_literal: true

module Endpoints
  class Authentications < Grape::API
    namespace :authentications do

      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
      end
      post do
        authentication = Services::Authentication.new(params[:email], params[:password])

        if authentication.success?
          present token: authentication.token
        else
          unauthorized!
        end
      end
    end
  end
end
