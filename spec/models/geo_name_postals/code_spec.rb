require 'rails_helper'

module GeoNamePostals
  RSpec.describe Code, type: :model do
    describe 'scopes' do
      describe '#ordered' do
        it 'orders geonames ascending order' do
          au_postal_code = create(:au_postal_code)
          us_postal_code = create(:us_postal_code)
          expect(described_class.ordered).to eq([us_postal_code,au_postal_code])
        end
      end
      describe '#by_postal_code' do
        it 'orders geonames ascending order' do
          au_postal_code = create(:au_postal_code)
          us_postal_code = create(:us_postal_code)

          result = described_class.by_postal_code(us_postal_code.postal_code[0..2])

          expect(result).to include(us_postal_code)
          expect(result).not_to include(au_postal_code)
        end
      end
      describe '#by_country' do
        it 'orders geonames ascending order' do
          au_postal_code = create(:au_postal_code)
          us_postal_code = create(:us_postal_code)

          result = described_class.by_country(au_postal_code.country_name)

          expect(result).not_to include(us_postal_code)
          expect(result).to include(au_postal_code)
        end
      end
    end
  end
end
