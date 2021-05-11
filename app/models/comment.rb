class Comment < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  after_create_commit { CommentBroadcastJob.perform_later self }
  after_create_commit  :create_notification_comment

  def create_notification_comment
    @comment = Comment.order(updated_at: :desc).first
    save_notification_comment!(@comment.note.user_id, @comment.id, @comment.user_id)
  end
  
  def save_notification_comment!(visited_id, comment_id, visiter_id)
    notification = Notification.find_or_initialize_by(
      note_id: @comment.note_id, 
      comment_id: comment_id,
      visiter_id: visiter_id,
      visited_id: visited_id,
      action: 'comment')
      # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id != notification.visited_id
      notification.save if notification.valid?
    end
  end
end
