class Event < ActiveRecord::Base
  attr_accessible :creator_id, :ended_at, :location, :name, :started_at,:event_id,:eventusers_attributes
   belongs_to :user,:foreign_key=>"creator_id"
  has_many :eventusers
  accepts_nested_attributes_for :eventusers
end
