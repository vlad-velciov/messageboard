ENV['RACK_ENV'] = 'test'

require 'rack/test'
require_relative '../config/application'

ActiveRecord::Base.logger.level = Logger::INFO

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Rack::Test::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

def app
  Messageboard.new
end
