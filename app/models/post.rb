class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :presence => true
  validates :post_text, :presence => true
end
