class ServicesController < ApplicationController
    def search
        selected_location = params[:location_name]
        @service_location = ServiceLocation.where(location_name: selected_location)
        render json: @service_location
    end
end
