class CommentsController < ApplicationController

  def index
    @user = current_user
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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to note_comments_path, notice: 'コメントを削除しました'
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      render note_comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, note_id: params[:note_id])
  end

 
end
