class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comment_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Comment.create(content: data['message'][0], user_id: data['message'][1], note_id: data['message'][2])
  end
end
