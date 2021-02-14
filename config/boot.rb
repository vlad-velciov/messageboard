# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
# $LOAD_PATH.unshift(File.dirname(__FILE__))
#
# Dir[File.expand_path('../app/**/*.rb', __dir__)].sort.each do |lib|
#   require lib
# end

loader = Zeitwerk::Loader.new
loader.push_dir('app/api')
loader.push_dir('app/models')
loader.push_dir('app/services')
loader.push_dir('app')
loader.enable_reloading

loader.setup
loader.eager_load

OTR::ActiveRecord.configure_from_file!('config/database.yml')
