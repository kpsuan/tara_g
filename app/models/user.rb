class User < ApplicationRecord
  # Devise modules...
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Events the user created
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  # Attended events (through EventAttendance)
  has_many :event_attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :event_attendances, source: :attended_event
end
