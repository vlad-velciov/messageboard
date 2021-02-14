module Endpoints
  class Auth < Grape::API
    namespace :auth do

      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
        requires :timezone, type: String, documentation: { in: 'body' }
      end
      post '/register' do
        registration = Registration.new(params[:email], params[:password], params[:timezone])
        user = registration.call

        present user, with: Entities::User
      end

      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
      end
      post '/authenticate' do
        authentication = Authentication.new(params[:email], params[:password])

        if authentication.success?
          present token: authentication.token
        else
          error!({ code: 401, message: 'Unauthorized' }, 401)
        end
      end
    end
  end
end
