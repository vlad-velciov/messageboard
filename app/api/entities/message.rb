# frozen_string_literal: true

module Entities
  class Message < Grape::Entity
    expose :id, :message, :created_at, :updated_at
    expose :sender, using: Entities::User
    expose :receiver, using: Entities::User
  end
end
