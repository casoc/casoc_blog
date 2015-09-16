class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]
  before_action :set_category, only: [:new, :edit]
  before_action :signed_in_user, except: [:index, :show]

  def index
    page = params[:page] || 1
    @articles = Article.search(params).page(page).per(5).order('created_at desc')
  end

  def show
    @article = Article.where(id: params[:id]).includes(:comments, :gallery).first
    @article.update(read_count: @article.read_count.to_i + 1)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.where(id: params[:id]).includes(:gallery).first
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_category
      @categories = Category.all.map { |category| [category.name, category.id] }
      @galleries  = Gallery.all.map { |gallery| [gallery.title, gallery.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id, :gallery_id)
    end
end
