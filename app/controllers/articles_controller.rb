class ArticlesController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
  @articles = Article.all
  end

  def new
  @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
   @article = Article.new(article_params)
    @article.user = current_user
     if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end

  end


def edit
    @article = Article.find(params[:id])
  end

def update
    @article = Article.find(params[:id]) #получаем саму статью

      if @article.valid?
      @article.update(article_params)
       flash[:notice] = "Article was updated"
      redirect_to @article
    else
         flash[:notice] = "Article was not updated"
      render action: 'edit'
    end
  end



def destroy
    @article = Article.find(params[:id])
    @article.destroy
     redirect_to articles_path
  end


private
def article_params
params.require(:article).permit(:title, :text)
end
end



