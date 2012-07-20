class Like < ActiveRecord::Base
  attr_accessible :like_id, :like_type,:user_id
  belongs_to :like,:polymorphic=>true
  belongs_to :user
end
