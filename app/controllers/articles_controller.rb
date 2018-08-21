class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article_form = ArticleForm.new(article: Article.new)
    # @article_form = ArticleForm.new()
    # @article_form = ArticleForm.new(article_params(Article.new).merge(category1: Category.find(1), category2: Category.find(2)))
  end

  def edit
    @article_form = ArticleForm.new(article_params(@article))
    @tags = @article_form.show_tags
  end

  def create
    @article_form = ArticleForm.new(article_form_params)
    # create_article_and_send_mail = CreateArticleAndSendMail.new(@article)

    if @article_form.save
      redirect_to @article_form.article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    # update_article_and_send_mail = UpdateArticleAndSendMail.new(@article)
    @article_form = ArticleForm.new(article_form_params.merge(article: @article))

    if @article_form.update
      redirect_to @article_form.article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    def article_params(article)
      {
        title: article.title,
        body: article.body,
        category1: article.categories[0],
        category2: article.categories[1],
        article: article
      }
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def article_form_params
      params.require(:article_form).permit(:title, :body, :category1, :category2)
    end
end
