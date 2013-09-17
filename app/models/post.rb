class Post < ActiveRecord::Base
  validates_presence_of :title, message: "Title can\'t be blank."
  
  belongs_to :user
  has_many :comments
  has_many :category_postships
  has_many :categories, through: :category_postships

  def creator
    self.user
  end
end