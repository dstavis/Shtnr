class Url < ActiveRecord::Base
  belongs_to :user
  validates :original, :format => {with: /(http:\/\/|https:\/\/)(w{3}[.])?([\w\d]+)([.][a-zA-Z]{2,3})([.][a-zA-Z]{2,3})?/}

  after_validation :fill_in

  def fill_in
  	self.short = SecureRandom.urlsafe_base64(4)
  end

  def click
	self.click_count += 1
	self.save	
  end

end
