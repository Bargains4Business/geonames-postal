GeoNames::Engine.routes.draw do
  get 'search', controller: 'geo_names', defaults: { format: 'json' }
end
