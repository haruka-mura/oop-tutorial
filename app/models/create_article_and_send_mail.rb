class CreateArticleAndSendMail
  include ActiveModel::Model
  attr_reader :article

  def initialize(article)
    @article = article
  end

  def save
    article.save
  end
end
