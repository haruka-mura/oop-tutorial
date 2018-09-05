class ArticleForm
  include ActiveModel::Model
  attr_accessor :title, :body, :category1, :category2, :article
  validates :title, article_length: { attribute: :body, minimum: 100 }

  delegate :persisted?, to: :article

  def save
    tags_and_title = CreateTag.new(title: title)
    @article = Article.new(title: tags_and_title.article_title, body: body)
    @article.categories << Category.find_by(id: category1) if category1
    @article.categories << Category.find_by(id: category2) if category2

    tags_and_title.tags.each do |tag|
      @article.tags << Tag.find_or_initialize_by(name: tag)
    end

    if valid?
      create_article_and_send_mail = CreateArticleAndSendMail.new(article)
      create_article_and_send_mail.save
    else
      false
    end
  end

  def update
    @article.categories.clear
    @article.categories << Category.find_by(id: category1) if category1
    @article.categories << Category.find_by(id: category2) if category2
    # article.update(article_parms.article)
    update_article_and_send_mail = UpdateArticleAndSendMail.new(article)
    update_article_and_send_mail.update(params)
  end

  def show_tags
    if self.article.tags.exists?
      @tags = []
      self.article.tags.each do |tag|
        @tags << tag.name
      end
      @tags = "[#{@tags.join(" ").gsub(/\[|\]|\"/, "")}] "
    else
      @tags = ""
    end
  end

  private

    def params
      {
        title: title,
        body: body
      }
    end
end
