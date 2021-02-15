# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :message_notifications
  has_many :messages, through: :message_notifications

  has_many :unread_message_notifications, -> { where(message_notifications: {read: false}) }, class_name:
    'MessageNotification'
  has_many :unread_messages, through: :unread_message_notifications, source: :message
end
