class Url < ActiveRecord::Base
  belongs_to :user
  validates :original, :format => {with: /w{3}[.][\w\d]+[.](com|org|net|biz)/}
end
