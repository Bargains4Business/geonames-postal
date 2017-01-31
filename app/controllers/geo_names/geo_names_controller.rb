require_dependency "geo_names/application_controller"

module GeoNames
  class GeoNamesController < ApplicationController
    def search
      return render json: { error: 'postal_code and country are required'}, status: 422 if params[:postal_code].blank? || params[:country].blank?
      @geo_names = GeoNameQuery.new(params[:postal_code], params[:country]).perform
    end
  end
end
