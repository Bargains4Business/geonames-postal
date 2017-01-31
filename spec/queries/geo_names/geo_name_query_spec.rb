require 'rails_helper'

module GeoNames
  RSpec.describe GeoNameQuery, type: :query_object do
    describe '.query_postal_code_for_argentina' do
      it 'handles 4 digits postal codes' do
        postal_code = create(:ar_postal_code)
        relation = GeoNameQuery.new(postal_code.postal_code, postal_code.country_code).perform
        like_expression = relation.where_values.first
        expect(like_expression).to match(/%#{postal_code.postal_code}/)
      end
      it 'handles 5 digits postal codes' do
        postal_code = create(:ar_postal_code, postal_code: "12345")
        relation = GeoNameQuery.new(postal_code.postal_code, postal_code.country_code).perform
        like_expression = relation.where_values.first
        expect(like_expression).to match(/12345/)
      end
    end
  end
end
