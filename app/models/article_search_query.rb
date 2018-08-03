class ArticleSearchQuery
  include ActiveModel::Model

  attr_accessor :keyword

  def articles
    scope = Article.all
    scope = scope.where("title like?", "%#{sanitize_sql_like(keyword)}%" )
    scope
  end

  # def keyword
  #   "%#{Article.sanitize_sql_like()}%" unless keyword.blank?
  # end

  private

    def sanitize_sql_like(text)
      ActiveRecord::Base.send(:sanitize_sql_like, text)
    end

end
# ポイント：責務はquery, articleのActiveRcordRelationを返すのかnilを返すのか, sanitaizeを使う
