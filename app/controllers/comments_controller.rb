class CommentsController < ApplicationController

  def index
    @note = Note.find(params[:note_id])
    @comments = Comment.where(note_id: @note.id).order(id: 'DESC')
    @comment = Comment.new
    @notifications = current_user.passive_notifications
    #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
      @notifications.where(checked: false).each do |notification|
          notification.update_attributes(checked: true)
    end
  end

  def create
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, note_id: params[:note_id])
  end

 
end
