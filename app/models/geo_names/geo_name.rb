module GeoNames
  class GeoName < ActiveRecord::Base
    scope :ordered, -> { order(:place_name) }
    scope :get_by_postal_code, ->(q) { where("postal_code like ?", "#{q}%").ordered }
  end
end
