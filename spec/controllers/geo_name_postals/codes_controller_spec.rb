require 'rails_helper'

module GeoNamePostals
  RSpec.describe CodesController, type: :controller do
    routes { GeoNamePostals::Engine.routes }

    describe "GET #search" do
      render_views

      context "invalid request" do
        subject { get :search, postal_code: "", format: :json }
        specify { expect(subject).to have_http_status(:unprocessable_entity) }
      end

      context "valid request" do
        let(:au_postal_code) { create(:au_postal_code) }

        subject { get :search, postal_code: au_postal_code.postal_code, country: au_postal_code.country_code, format: :json }

        specify { expect(subject).to have_http_status(:success) }
        specify { expect(json(subject.body).first['postal_code']).to eq(au_postal_code.postal_code) }
      end
    end
  end
end
