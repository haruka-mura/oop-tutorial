class Category < ApplicationRecord
  has_many :article_categories, through: :articles
  has_many :articles
end
