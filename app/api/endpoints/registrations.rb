# frozen_string_literal: true

module Endpoints
  class Registrations < ApplicationEndpoint

    namespace :registrations do

      desc 'Registers a new user'
      params do
        requires :email, type: String, documentation: { in: 'body' }
        requires :password, type: String, documentation: { in: 'body' }
        requires :timezone, type: String, documentation: { in: 'body' }
      end
      post do
        registration = Services::Registration.new(params[:email], params[:password], params[:timezone])
        user = registration.call

        present user, with: Entities::User
      end
    end

  end
end
