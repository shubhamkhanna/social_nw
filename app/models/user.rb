class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :friends,:foreign_key=>"user_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:firstname,:middlename,:lastname, :age, :dob, :phno, :address, :sconame, :scoaddress,:avtar
  # attr_accessible :title, :body
has_attached_file :avtar, :styles => 
  { :medium => "300x300>", :thumb => "100x100>" }
end
