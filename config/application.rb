# frozen_string_literal: true

require_relative 'environment'
require_relative 'boot'

class Messageboard
  def initialize
    @apps = {}
  end

  def call(env)
    Base.call(env)
  end
end
