class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article_form = ArticleForm.new()
  end

  # GET /articles/1/edit
  def edit
    @article_form = ArticleForm.new(article_params(@article))
  end

  # POST /articles
  # POST /articles.json
  def create
    @article_form = ArticleForm.new(article_form_params)

    # create_article_and_send_mail = CreateArticleAndSendMail.new(@article)

    if @article_form.save
      redirect_to @article_form.article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    update_article_and_send_mail = UpdateArticleAndSendMail.new(@article)
    respond_to do |format|
      if update_article_and_send_mail.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
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

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_form_params
      params.require(:article_form).permit(:title, :body, :category1, :category2)
    end
end
