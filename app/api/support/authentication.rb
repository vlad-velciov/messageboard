# frozen_string_literal: true

module Support
  module Authentication
    def authenticate_token!
      params[:principal] = Services::AppToken.from_token(request_token)

      unauthorized! unless principal.valid?
    end

    def principal
      params[:principal]
    end

    def request_token
      auth_header = headers['Authorization']
      unauthorized! if auth_header.blank?
      auth_header.split(' ').last
    end
  end
end
