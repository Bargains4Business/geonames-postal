Rails.application.routes.draw do
  mount GeoNamePostals::Engine => "/geo_name_postals"
end
