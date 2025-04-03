# app/services/google_calendar_service.rb
require 'google/apis/calendar_v3'
require 'googleauth'
class GoogleCalendarService
  def initialize
    @calendar_service = Google::Apis::CalendarV3::CalendarService.new
    @calendar_service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(Rails.root.join('config', 'credentials', 'google_calendar_key.json')),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR
    )
  end

  def create_event(summary, start_time, end_time, description, location)
    event = Google::Apis::CalendarV3::Event.new(
      summary: summary,
      start: Google::Apis::CalendarV3::EventDateTime.new(date_time: start_time),
      end: Google::Apis::CalendarV3::EventDateTime.new(date_time: end_time),
      description: description,
      location: location
    )
    calendar_id = 'sandiegobonfires@gmail.com'
    @calendar_service.insert_event(calendar_id, event)
  end
end