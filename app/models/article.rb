class Article < ApplicationRecord
  has_many :articles_categories
  has_many :categories, through: :articles_categories
end
