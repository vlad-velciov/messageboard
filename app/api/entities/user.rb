# frozen_string_literal: true

module Entities
  class User < Grape::Entity
    expose :id, :email, :timezone, :created_at, :updated_at
  end
end
