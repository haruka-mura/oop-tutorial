class ArticleSearchForm
  include ActiveModel::Model

  attr_accessor :keyword

  def articles
    if keyword.nil?
      Article.all
    else
      ArticleSearchQuery.new({keyword: keyword}).articles
    end
  end
end
