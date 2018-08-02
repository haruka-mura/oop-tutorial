class ArticleSearchController < ApplicationController
  def search
    @articles = Article.all
    @article_search_query = ArticleSearchQuery.new(keyword)
  end

  private
   def params
     params.require(:article_form).permit(:keyword)
   end
end
