require 'rails_helper'

module GeoNamePostals
  RSpec.describe CodeQuery, type: :query_object do
    describe '.query_postal_code_for_copyrighted_countries' do
      it 'extracts first 3 digits of the postal codes' do
        postal_code = create(:ca_postal_code, postal_code: "123456")
        sql = described_class.new(postal_code.postal_code, postal_code.country_code).perform.to_sql
        expect(sql).to match(/123/)
        expect(sql).not_to match(/123456/)
      end
    end
    describe '.query_postal_code_for_argentina' do
      it 'handles less than 4 digits postal codes' do
        postal_code = create(:ar_postal_code, postal_code: "123")
        relation = described_class.new(postal_code.postal_code, postal_code.country_code).perform
        expect(relation.to_sql).to match(/%#{postal_code.postal_code}%/)
      end
      it 'handles 4 digits postal codes' do
        postal_code = create(:ar_postal_code)
        relation = described_class.new(postal_code.postal_code, postal_code.country_code).perform
        expect(relation.to_sql).to match(/#{postal_code.postal_code}/)
      end
      it 'handles 5 digits postal codes' do
        postal_code = create(:ar_postal_code, postal_code: "12345")
        sql = described_class.new(postal_code.postal_code, postal_code.country_code).perform.to_sql
        expect(sql).not_to match(/1/)
        expect(sql).to match(/2345/)
      end
    end
  end
end
