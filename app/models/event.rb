class Event < ApplicationRecord
	belongs_to :creator, class_name: "User", foreign_key:'creator_id'
	has_many :attendees, class_name: "Attendee", foreign_key:'attended_event_id', dependent: :destroy
	scope :upcoming, -> { where("event_date > ? ",Time.now) }
	scope :past, -> { where("event_date < ?", Time.now) }

	validates_presence_of :creator_id
end
