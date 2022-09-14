# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :is_author?, only: %i[edit update destroy]
  after_action :log, only: %i[show]
  def index
    @articles = Article.order(:created_at).page params[:page]
    respond_to do |format|
      format.html
      format.json
      format.xml do
        render index: @articles
      end
      format.pdf do
        render pdf: "List of #{@articles.count} articles", template: 'articles/list_of_articles', formats: [:html]
      end
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.xml do
        render show: @article
      end
      format.pdf do
        render pdf: "Article id: #{@article.id}", template: 'articles/article', formats: [:html]
      end
    end
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
    @article = Article.find(params[:id]) # получаем саму статью

    if @article.valid?
      @article.update(article_params)
      flash[:success] = 'Article was updated'
      redirect_to @article
    else
      flash[:success] = 'Article was not updated'
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def is_author?
    @article = Article.find(params[:id])
    redirect_to articles_path unless @article.user_id == current_user.id
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def log
    log_params = {
      remote_ip: request.remote_ip,
      request_method: request.method,
      request_url: request.url,
      response_status: response.status,
      response_content_type: response.content_type
    }
    Log.create(log_params)
  end
end
