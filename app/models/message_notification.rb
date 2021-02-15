# frozen_string_literal: true

class MessageNotification < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
end
