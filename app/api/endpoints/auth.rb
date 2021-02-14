module Endpoints
  class Auth < Grape::API
    namespace :auth do

      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
        requires :timezone, type: String, documentation: { in: 'body' }
      end
      post '/register' do

      end

      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
      end
      post '/authenticate' do

      end
    end
  end
end
