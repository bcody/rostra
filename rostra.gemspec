$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rostra/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rostra"
  s.version     = Rostra::VERSION
  s.authors     = ["Cory Schires"]
  s.email       = ["coryschires@gmail.com"]
  s.homepage    = "https://github.com/coryschires/rostra"
  s.summary     = "Rostra allows you to quickly add a question and answer forum to your application."
  s.description = "Rostra allows you to quickly add a question and answer forum to your application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "jquery-rails", "~> 1.0.14"
  s.add_dependency "acts-as-taggable-on", "~> 2.1.1"
  s.add_dependency "cancan", "~> 1.6.7"
  s.add_dependency 'simple_form'
  s.add_dependency 'client_side_validations'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "launchy"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rspec-rails", "~> 2.5"
  s.add_development_dependency "devise"

end
