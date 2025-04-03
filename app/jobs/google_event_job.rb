class GoogleEventJob < ApplicationJob
  queue_as :default

  def perform(order)
    byebug
    calendar_service = GoogleCalendarService.new
    summary = "User Order ID #{order.id} Approved"
    date = order.setup_time.strftime("%Y-%m-%d")
    time = order.setup_time_slot.split[0]
    start_time =  Time.zone.parse(date +' '+ time).to_datetime
    end_time = start_time + 30.minutes
    description = 'Order approval details'
    location = order.cart.service_location.location_name
    
    calendar_service.create_event(summary, start_time, end_time, description, location)
  end
end
