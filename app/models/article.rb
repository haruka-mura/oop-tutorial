class Article < ApplicationRecord
  has_many :article_categories, through: :categories
  has_many :categories
end
