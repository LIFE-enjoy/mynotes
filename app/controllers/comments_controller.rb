class CommentsController < ApplicationController

  def index
    @note = Note.find(params[:note_id])
    @comments = Comment.where(note_id: @note.id).order(id: 'DESC')
    @comment = Comment.new
  end

  def create
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, note_id: params[:note_id])
  end

 
end
