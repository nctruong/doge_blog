class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, :as => :voteable
  validates :title, presence: true
  validates :post_text, presence: true
end
