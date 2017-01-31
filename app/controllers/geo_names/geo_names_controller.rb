require_dependency "geo_names/application_controller"

module GeoNames
  class GeoNamesController < ApplicationController
    def search
      return render json: { error: 'query cannot be empty'}, status: 422 if params[:q].blank?
      @geo_names = GeoNameQuery.new(params[:q], params[:country]).perform
    end
  end
end
