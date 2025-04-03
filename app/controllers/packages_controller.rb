class PackagesController < ApplicationController

  def index
    byebug
    @packages = Package.all
  end

  def show
    byebug
    @package = Package.find(params[:id])
    @service_locations = ServiceLocation.all
  end

  def filter_packages
    byebug
    service_id = Service.find_by(name: params[:name]).id
    @service_location = ServiceLocation.find_by(location_name: params[:location_name])
    @packages =  Package.where(service_id:service_id)
    $setup_time = params[:setup_time]
    $setup_time_slot = params[:setup_time_slot]
  end

end
