require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

require "cancan/matchers"
require 'factory_girl_rails'
require File.dirname(__FILE__) + "/factories"
require 'database_cleaner'

ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true

  DatabaseCleaner.strategy = :truncation
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    DatabaseCleaner.clean
    User.create(email: 'coryschires@gmail.com', password: 'password', name: 'Cory Schires')
  end

end
