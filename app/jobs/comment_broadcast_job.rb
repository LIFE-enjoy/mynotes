class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast 'comment_channel', message: render_message(comment)
  end

  private

  def render_message(comment)
    ApplicationController.render_with_signed_in_user(comment.user, partial: 'comments/comment', locals: { comment: comment })
  end
end
