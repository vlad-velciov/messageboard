# frozen_string_literal: true

class Base < Grape::API
  version 'v1', using: :path
  format :json

  helpers Support::Authentication
  helpers Support::Response

  mount Endpoints::Registrations
  mount Endpoints::Authentications

  namespace do
    before { authenticate_token! }

    mount Endpoints::Messages
    mount Endpoints::UserMessages
  end

  add_swagger_documentation format:     :json,
                            info:       {
                              title: 'Messageboard API'
                            },
                            schemes: 'http',
                            models:     [
                                          Entities::Message,
                                          Entities::User
                                        ]

  get :status do
    { status: :ok, version: '0.0.1' }
  end
end
