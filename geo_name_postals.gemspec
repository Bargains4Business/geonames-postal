$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "geo_name_postals/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "geoname-postals"
  s.version     = GeoNamePostals::VERSION
  s.authors     = ["Bikeroar"]
  s.email       = ["bikeroar@bikeroar.com"]
  s.homepage    = ""
  s.summary     = "Summary of GeoNamePostals."
  s.description = "Description of GeoNamePostals."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "countries"
  s.add_dependency "jbuilder"
  s.add_dependency "activerecord-import"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'

  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rails'

  s.add_development_dependency 'thin'

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'activerecord-import'

  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'better_errors'
  s.add_development_dependency 'binding_of_caller'
  s.add_development_dependency 'hirb'
  s.add_development_dependency 'rake'
end
