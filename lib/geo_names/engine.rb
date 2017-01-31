module GeoNames
  class Engine < ::Rails::Engine
    isolate_namespace GeoNames

    config.generators do |g|
      g.test_framework :rspec, fixtures: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    rake_tasks do
      load File.expand_path("../tasks/seed.rake", __FILE__)
    end
  end
end
