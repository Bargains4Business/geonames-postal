require 'rails_helper'

module GeoNames
  RSpec.describe GeoName, type: :model do
    describe 'scopes' do
      describe '#ordered' do
        it 'orders geonames ascending order' do
          au_postal_code = create(:au_postal_code)
          us_postal_code = create(:us_postal_code)
          expect(described_class.ordered).to eq([us_postal_code,au_postal_code])
        end
      end
      describe '#get_by_postal_code' do
        it 'orders geonames ascending order' do
          au_postal_code = create(:au_postal_code)
          us_postal_code = create(:us_postal_code)

          result = described_class.get_by_postal_code(us_postal_code.postal_code[0..2])

          expect(result).to include(us_postal_code)
          expect(result).not_to include(au_postal_code)
        end
      end
    end
  end
end
