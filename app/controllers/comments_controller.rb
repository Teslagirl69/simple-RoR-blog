# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create

    @article = Article.find(params[:article_id])
    comment = @article.comments.create(comment_params)
    comment.user = current_user
   comment.author = current_user.username
   comment.save
    redirect_to articles_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
