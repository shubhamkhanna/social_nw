class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :friends,:foreign_key=>"user_id"
  has_many :posts,  :foreign_key=>"user_id"
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  has_many :likes
  has_many :events,:foreign_key=>"creator_id"
  has_many :eventusers,:foreign_key=>"user_id"
  accepts_nested_attributes_for :eventusers
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:firstname,:middlename,:lastname, :age, :dob, :phno, :address, :sconame, :scoaddress,:avtar,:event_id, :user_id
  # attr_accessible :title, :body
has_attached_file :avtar, :styles => 
  { :medium => "300x300>", :thumb => "300x300>",:small=>"50x50" }
end
