class ArticleSearchController < ApplicationController
  def search
    @article_search_form = ArticleSearchForm.new(search_params)
  end

  private
   def search_params
     params.fetch(:article_search_form, {}).permit(:keyword)
   end
end
