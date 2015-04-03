class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_name, :presence => true
  validates :comment_text, :presence => true

end
