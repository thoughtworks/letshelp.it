ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'shoulda'

Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include Capybara
  config.after { Organization.delete_all }
end

