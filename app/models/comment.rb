class Comment < ActiveRecord::Base
  validates_presence_of :content, message: "Content can\'t be blank."

  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :post
end