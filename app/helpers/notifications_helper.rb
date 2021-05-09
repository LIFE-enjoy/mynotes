module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_item = link_to "#{notification.note.title}", note_comments_path(notification.note_id), style:"font-weight: bold;"
    @visiter_comment = notification.comment_id
    @comment = Comment.find_by(id: @visiter_comment)&.content
    tag.a(@visiter.nickname, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a( your_item, href:note_comments_path(notification.note_id), style:"font-weight: bold;")+"にコメントしました"
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
