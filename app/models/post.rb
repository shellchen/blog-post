class Post < ActiveRecord::Base
  include TealeafVoteable
  validates_presence_of :title, message: "Title can\'t be blank."
  
  belongs_to :user
  has_many :comments
  has_many :category_postships
  has_many :categories, through: :category_postships

  after_validation :generate_slug

  def creator
    self.user
  end

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end
end