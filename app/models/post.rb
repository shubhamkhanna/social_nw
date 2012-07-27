class Post < ActiveRecord::Base
  attr_accessible :message, :user_id
  belongs_to :user
  has_many :comments,:foreign_key=>"post_id"
  has_many  :likes,:as =>:like
  has_many :shares
  scope :from_5_days, :conditions => ["created_at < '#{5.days.from_now}'"]

  scope :user_friends_post, lambda {|userid| where(["user_id in (?)",userid]).order("created_at desc") }
end
