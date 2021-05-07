class CommentsController < ApplicationController
  def index
    @note = Note.find(params[:note_id])
    @comment = Comment.new
    @other_user = User.includes(:comments)
    @user = current_user
    @comments = Comment.where(note_id: @note.id).order(id: 'DESC')
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, note_id: params[:note_id])
  end
end
