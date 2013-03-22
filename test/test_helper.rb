require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'action_view/template_handler' 

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  def login(user = users(:one))
    sign_in user
  end

  # ActiveSupport.on_load(:action_view) do
  #   include ExtraHelpers
  # end
  #render_views
  # Add more helper methods to be used by all tests here...
end
