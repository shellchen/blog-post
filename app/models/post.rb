class Post < ActiveRecord::Base
  validates_presence_of :title, message: "Title can\'t be blank."
  
  belongs_to :user
  has_many :comments
  has_many :category_postships
  has_many :categories, through: :category_postships
  has_many :votes, as: :voteable

  def creator
    self.user
  end

  def plus_vote_count
    self.votes.where(vote: true).count
  end

  def minus_vote_count
    self.votes.where(vote: false).count
  end
end