# frozen_string_literal: true

class Base < Grape::API
  version 'v1', using: :path
  format :json

  mount Endpoints::Messages
  mount Endpoints::Auth

  add_swagger_documentation format:     :json,
                            info:       {
                              title: 'Messageboard API'
                            },
                            mount_path: '/api-doc',
                            models:     [
                                          Entities::ApiError
                                        ]

  get :status do
    { status: :ok, version: '0.0.1' }
  end
end
