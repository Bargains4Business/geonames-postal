require_dependency "geo_names/application_controller"

module GeoNames
  class GeoNamesController < ApplicationController
    def search
      return render json: { error: 'postal_code and country are requiredss'}, status: 422 if params[:postal_code].blank? || params[:country].blank?
      @geo_names = GeoNameQuery.new(params[:postal_code].strip, params[:country].strip).perform
    end
  end
end
