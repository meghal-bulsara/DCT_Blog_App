class CommentsController < ApplicationController
  def create
    #@comment = Article.find(params[:comment].permit(:article_id))
    @comment = Comment.new(params[:comment].permit(:title,:body,:article_id))
    if @comment.save
      redirect_to  article_path(@comment.article_id)
    end
  end
end
