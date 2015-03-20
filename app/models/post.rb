class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :post_text, :presence => true
end
