class ArticlesCategoriesController < ApplicationController
  before_action :set_articles_category, only: [:show, :edit, :update, :destroy]

  # GET /articles_categories
  # GET /articles_categories.json
  def index
    @articles_categories = ArticlesCategory.all
  end

  # GET /articles_categories/1
  # GET /articles_categories/1.json
  def show
  end

  # GET /articles_categories/new
  def new
    @articles_category = ArticlesCategory.new
  end

  # GET /articles_categories/1/edit
  def edit
  end

  # POST /articles_categories
  # POST /articles_categories.json
  def create
    @articles_category = ArticlesCategory.new(articles_category_params)

    respond_to do |format|
      if @articles_category.save
        format.html { redirect_to @articles_category, notice: 'Articles category was successfully created.' }
        format.json { render :show, status: :created, location: @articles_category }
      else
        format.html { render :new }
        format.json { render json: @articles_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles_categories/1
  # PATCH/PUT /articles_categories/1.json
  def update
    respond_to do |format|
      if @articles_category.update(articles_category_params)
        format.html { redirect_to @articles_category, notice: 'Articles category was successfully updated.' }
        format.json { render :show, status: :ok, location: @articles_category }
      else
        format.html { render :edit }
        format.json { render json: @articles_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_categories/1
  # DELETE /articles_categories/1.json
  def destroy
    @articles_category.destroy
    respond_to do |format|
      format.html { redirect_to articles_categories_url, notice: 'Articles category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articles_category
      @articles_category = ArticlesCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articles_category_params
      params.require(:articles_category).permit(:article_id, :category_id)
    end
end
