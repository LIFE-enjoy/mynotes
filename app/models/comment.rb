class Comment < ApplicationRecord
  belongs_to :note
  belongs_to :user

  validates :content, presence: true

end
