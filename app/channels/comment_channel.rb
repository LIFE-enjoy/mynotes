class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comment_channel'
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    comment = Comment.new(content: data['message'][0], user_id: data['message'][1], note_id: data['message'][2])
    comment.save
    ActionCable.server.broadcast 'comment_channel', message: render_message(comment)
  end

  private

  def render_message(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
