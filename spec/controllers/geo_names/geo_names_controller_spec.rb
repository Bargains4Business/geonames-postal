require 'rails_helper'

module GeoNames
  RSpec.describe GeoNamesController, type: :controller do
    routes { GeoNames::Engine.routes }

    describe "GET #search" do
      render_views

      context "invalid request" do
        subject { get :search, q: "", format: :json }
        specify { expect(subject).to have_http_status(:unprocessable_entity) }
      end

      context "valid request" do
        let(:au_postal_code) { create(:au_postal_code) }

        subject { get :search, q: au_postal_code.postal_code, format: :json }

        specify { expect(subject).to have_http_status(:success) }
        specify { expect(json(subject.body).first['postal_code']).to eq(au_postal_code.postal_code) }
      end
    end
  end
end
