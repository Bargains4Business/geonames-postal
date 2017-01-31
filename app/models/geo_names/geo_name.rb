module GeoNames
  class GeoName < ActiveRecord::Base
    scope :ordered, -> { order(:place_name) }
    scope :by_postal_code, ->(postal_code) { where("lower(postal_code) like ?", "#{postal_code.downcase}%").ordered }
    scope :by_country, ->(country) { where("lower(country_name) = :country OR lower(country_code) = :country OR lower(country_alpha3) = :country", country: country.downcase.strip).ordered }
  end
end
