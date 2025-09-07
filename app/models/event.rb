class Event < ApplicationRecord
  # Creator of the event
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  # Attendees of the event
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee

  # Scopes
  scope :past, -> { where("date < ?", Time.current) }
  scope :upcoming, -> { where("date >= ?", Time.current) }
end
