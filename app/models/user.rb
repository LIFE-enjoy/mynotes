class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes
  has_many :comments
  has_one_attached :avatar
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  validates :nickname, presence: true

  def self.guest
    find_or_create_by!(nickname: 'ゲスト',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  class User < ActiveRecord::Base
    def self.current
      Thread.current[:user]
    end
    def self.current=(user)
      Thread.current[:user] = user
    end
  end
end
