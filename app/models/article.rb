class Article < ApplicationRecord
  has_many :articles_categories, dependent: :destroy
  has_many :categories, through: :articles_categories

end
