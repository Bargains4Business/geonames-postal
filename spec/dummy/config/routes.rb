Rails.application.routes.draw do

  mount GeoNames::Engine => "/geo_names"
end
