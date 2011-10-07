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

# Always clean the database after running describe/context blocks to ensure a
# consistent state. This is especially important when using the <tt>rspec-set</tt>
# method. This method creates setup object once -- and only once -- proir to
# running an entire describe/context block. In this way, it's similar to using
# <tt>before(:all)</tt> except that <tt>set</tt> is better because:
#
#   * It automatically reloads the object before each example, making it much
#     safer than before(:all) which can cause bugs if you're not careful.
#   * It's lazily evaluated.
#
# You can read more at:
#
#   * eggsonbread.com/2010/05/25/speed-up-your-specs-with-set/
#   * github.com/pcreux/rspec-set
#
# Note: This is not part of default configuration. Be sure to retain this snippet
# when upgrading.
#
