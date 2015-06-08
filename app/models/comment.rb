class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :votes, :as => :voteable
  validates :comment_text, :presence => true

  def total_score
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(upvote: true).count
  end

  def down_votes
    self.votes.where(upvote: false).count
  end

end
