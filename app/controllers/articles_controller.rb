class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def show
     # @article = Article.find(params[:id])
  end

  def index
      @allArticle = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(get_params)
      if @article.save
        flash[:notice] = 'Article created sucessfully'
        redirect_to article_path(@article)
      else 
        render 'new'
      end    
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
      if @article.update(get_params)
        flash[:notice] = 'Article updated sucessfully'
        redirect_to article_path(@article)
      else 
        render 'new'
      end  
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def get_params
      params.require(:article).permit(:title, :description)
    end

end