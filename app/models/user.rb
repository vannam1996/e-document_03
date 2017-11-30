class User < ApplicationRecord
  has_many :transactions, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :history_downloads, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :nullify
  has_many :documents, dependent: :destroy
  has_many :active_friends, class_name: Friend.name,
    foreign_key: :sender_id,
    dependent: :destroy
  has_many :sending, through: :active_friends, source: :sender
  has_many :passive_friends, class_name: Friend.name,
    foreign_key: :accepter_id,
    dependent: :destroy
  has_many :accepting, through: :passive_friends, source: :accepter

  before_save :downcase_email

  validates :name, presence: true, length: {maximum: Settings.user.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.maximum_email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.minimum_password}
  mount_uploader :avatar, AvatarUploader

  private

  def downcase_email
    self.email = email.downcase
  end
end
