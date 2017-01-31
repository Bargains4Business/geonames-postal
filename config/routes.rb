GeoNamePostals::Engine.routes.draw do
  get 'search', controller: 'codes', defaults: { format: 'json' }
end
