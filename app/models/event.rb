class Event < ActiveRecord::Base
  attr_accessible :creator_id, :ended_at, :location, :name, :started_at
  belongs_to :user
  has_many :event_users
end
