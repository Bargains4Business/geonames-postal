module GeoNames
  class GeoName < ActiveRecord::Base
    scope :ordered, -> { order(:place_name) }
    scope :by_postal_code, ->(postal_code) { where("postal_code like ?", "#{postal_code}%").ordered }
    scope :by_country, ->(country) { where("country_name = :country OR country_code = :country OR country_alpha3 = :country", country: country).ordered }
  end
end
