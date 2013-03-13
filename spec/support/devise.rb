RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  # config.extend SignHelper, :type => :controller
  #config.include Devise:SignHelper, :type => :controller
end