class CalendarsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        cal.x_wr_calname = 'iCal Events Test'
        calendar.append_custom_property("REFRESH-INTERVAL;VALUE=DURATION","P1H")
        ::Event.all.each do |ev|
          event = Icalendar::Event.new
          event.dtstart     = ev.start_time
          event.dtend       = ev.end_time
          event.summary     = ev.title
          event.description = ev.description
          event.append_custom_property 'color', 'cornsilk'
          cal.add_event(event)
        end
        cal.publish
        render plain: cal.to_ical
      end
    end
  end
end

