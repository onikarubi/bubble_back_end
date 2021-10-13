class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comments = @book.comments.includes(:user)
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :book_id)
  end
end
