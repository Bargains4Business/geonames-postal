$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "geo_names/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "geo_names"
  s.version     = GeoNames::VERSION
  s.authors     = ["Kleber Correia"]
  s.email       = ["klebervirgilio@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GeoNames."
  s.description = "TODO: Description of GeoNames."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'

  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rails'
end
