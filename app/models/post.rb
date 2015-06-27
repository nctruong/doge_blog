class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, :as => :voteable
  validates :title, presence: true
  validates :post_text, presence: true

  def total_score
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(upvote: true).count
  end

  def down_votes
    self.votes.where(upvote: false).count
  end

  def self.search(q)
    where("title ILIKE ? OR post_text ILIKE ?", "%#{q}%", "%#{q}%")
  end

end
