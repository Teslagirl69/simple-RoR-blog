class SearchController < ApplicationController
  def index
    @query = Article.ransack(params[:q])
  end
end
