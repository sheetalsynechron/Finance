# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Finance::Application.initialize!
ENV['RECAPTCHA_PUBLIC_KEY']  = '6Lfzmd8SAAAAAKxcK4J3dbGs7qFDR7hRmlluDB-K'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lfzmd8SAAAAAMVbGsNNYTECuebUuVLrYAXQ9EV6'

