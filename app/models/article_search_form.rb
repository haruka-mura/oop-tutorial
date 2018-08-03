class ArticleSearchForm
  include ActiveModel::Model

  attr_accessor :keyword

  def articles
    if keyword.nil?
      Article.limit(2)
    else
      ArticleSearchQuery.new({keyword: keyword}).articles
    end
  end
end
