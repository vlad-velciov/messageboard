# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

Dotenv.load

loader = Zeitwerk::Loader.new
loader.push_dir('app/api')
loader.push_dir('app/models')
loader.push_dir('app')
loader.enable_reloading

loader.setup
loader.eager_load

OTR::ActiveRecord.configure_from_file!('config/database.yml')
