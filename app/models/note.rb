class Note < ApplicationRecord
  has_rich_text :action_text
  has_many_attached :images
  belongs_to :user
  has_many :comments, dependent: :destroy
end
