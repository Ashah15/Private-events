class Attendee < ApplicationRecord
	belongs_to :attendee, class_name: "User"
	belongs_to :attended_event, class_name: "Event", foreign_key: "attended_event.id"
end
