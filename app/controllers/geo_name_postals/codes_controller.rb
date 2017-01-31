require_dependency "geo_name_postals/application_controller"

module GeoNamePostals
  class CodesController < ApplicationController
    def search
      return render json: { error: 'postal_code and country are requiredss'}, status: 422 if params[:postal_code].blank? || params[:country].blank?
      @geo_name_postals = CodeQuery.new(params[:postal_code].strip, params[:country].strip).perform
    end
  end
end
