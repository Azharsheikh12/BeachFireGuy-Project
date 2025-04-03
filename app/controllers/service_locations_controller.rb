  class ServiceLocationsController < ApplicationController
    def index
      @service_locations = ServiceLocation.all
    end
  end
