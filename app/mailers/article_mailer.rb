class ArticleMailer < ApplicationMailer
  def new_article(article)
    @article = article
    mail to: "test@example.com"
  end

  def update_article()
  end
end
