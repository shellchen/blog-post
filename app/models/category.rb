class Category < ActiveRecord::Base
  validates_presence_of :name, message: "Name can\'t be blank."

  has_many :category_postships
  has_many :posts, through: :category_postships
end