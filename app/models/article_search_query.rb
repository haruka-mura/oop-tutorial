class ArticleSearchQuery
  include ActiveModel::Model

  attr_accessor :keyword

  def articles
    scope = Article.all
    scope = scope.where("title like?", "%#{keyword}%" )
    scope
  end

  # def keyword
  #   "%#{Article.sanitize_sql_like()}%" unless keyword.blank?
  # end
  #
  # def conditions
  #  result = []
  #  result << "title like :keyword" if keyword
  #  result
  # end
  #
  # def values
  #  { keyword: keyword }
  # end
end

# ポイント：責務はquery, articleのActiveRcordRelationを返すのかnilを返すのか, sanitaizeを使う
