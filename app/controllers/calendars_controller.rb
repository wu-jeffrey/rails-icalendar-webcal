# class CalendarsController < ApplicationController
#   def show
#     contrived_events = []

#     contrived_events.push({
#       id: 123,
#       link: 'www.hello.com',
#       title: 'ICAL EVENT 1',
#       lesson_content: '<h1>asdasd</h1><div>Huh?</div> www.google.ca',
#       color: "##{Random.bytes(3).unpack1('H*')}",
#       start_time: DateTime.current + 1.day,
#       end_time: DateTime.current + 1.day + 1.hour,
#     })
#     contrived_events.push({
#       id: 124,
#       link: 'www.hello.com',
#       title: 'ICAL EVENT 2',
#       lesson_content: '<h1 style="color:red !important;">Don\'t overcook the eggs.</h1><div>Bruh... you overcooked the eggs</div><a href="www.google.ca">Link to planboard</a><b>bold</b><p><b>This text is bold</b></p><p><i>This text is italic</i></p><p>This is<sub> subscript</sub> and <sup>superscript</sup></p><table style="width:100%"><tr><th>Firstname</th><th>Lastname</th><th>Age</th></tr><tr><td>Jill</td><td>Smith</td><td>50</td></tr><tr><td>Eve</td><td>Jackson</td><td>94</td></tr></table>',
#       color: "##{Random.bytes(3).unpack1('H*')}",
#       start_time: DateTime.current + 1.day + 2.hours,
#       end_time: DateTime.current + 1.day + 3.hours,
#     })

#     respond_to do |format|
#       format.html
#       format.ics do
#         cal = Icalendar::Calendar.new
#         cal.x_wr_calname = 'ICAL TEST'

#         events = contrived_events.map do |event|
#           cal.event do |e|
#             e.dtstart = Icalendar::Values::DateOrDateTime.new event.start_time
#             e.dtend   = Icalendar::Values::DateOrDateTime.new event.end_time
#             e.summary = event.title
#             e.description = event.lesson_content
#             e.x_color = 'cornsilk'
#           end
#         end

#         cal.publish
#         render plain: cal.to_ical
#       end
#     end
#   end
# end


class CalendarsController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        cal.x_wr_calname = 'Awesome Rails Calendar'
        cal.event do |e|
          e.dtstart     = DateTime.now + 2.hours
          e.dtend       = DateTime.now + 3.hours
          e.summary     = 'BRUH Lunch'
          e.description = 'Get together and do big things'
          e.x_color = 'navyblue'
        end
        cal.publish
        render plain: cal.to_ical
      end
    end
  end
end

