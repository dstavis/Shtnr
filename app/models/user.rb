class User < ActiveRecord::Base
  has_many :urls

  validates :email, uniqueness: true
  validates :email, format: { with: /(\w+)(@)([a-zA-Z]{2,})([.]\w{2,4})/,
    message: "Must be a valid single-tld email address with no special characters." }

  validates :password, presence: true  	  
end