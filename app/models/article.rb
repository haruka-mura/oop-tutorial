class Article < ApplicationRecord
  has_many :articles_categories, dependent: :destroy
  has_many :categories, through: :articles_categories
  has_many :articles_tags
  has_many :tags, through: :articles_tags

end
