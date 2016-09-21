class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

   def create
    comment = Comment.new(comment_params)
    entry = comment.entry
    flash.now[:danger] = "Comment invalid" unless comment.save
    redirect_to entry
end

  def destroy
    @id = params[:id]
    comment = Comment.find_by(id: @id)
    entry = comment.entry
    comment.destroy
    flash.now[:success] = "Comment deleted"
    redirect_to entry
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :entry_id)
  end
end
