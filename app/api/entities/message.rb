# frozen_string_literal: true

module Entities
  class Message < Grape::Entity
    expose :id, :message
    expose :sender, using: Entities::User

    expose :created_at do |message, options|
      message.created_at.in_time_zone(options[:timezone]) if options[:timezone]
    end

    expose :updated_at do |message, options|
      message.updated_at.in_time_zone(options[:timezone]) if options[:timezone]
    end
  end
end
