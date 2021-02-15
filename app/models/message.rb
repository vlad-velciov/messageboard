# frozen_string_literal: true

class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  has_many :message_notifications

  has_many :users, through: :message_notifications

  alias_attribute :receivers, :users
end
