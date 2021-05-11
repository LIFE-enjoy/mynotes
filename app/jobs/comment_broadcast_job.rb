class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast 'comment_channel', message_left: render_message_left(comment), 
    message_right: render_message_right(comment), chat_user: comment.user_id
  end

  private

  def render_message_left(comment)
    ApplicationController.render_with_signed_in_user(comment.user, partial: 'comments/comment_left', locals: { comment: comment })
  end

  def render_message_right(comment)
    ApplicationController.render_with_signed_in_user(comment.user, partial: 'comments/comment_right', locals: { comment: comment })
  end
end
