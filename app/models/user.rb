class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :transactions, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :history_downloads, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :nullify
  has_many :documents, dependent: :destroy
  has_many :active_friends, class_name: Friend.name,
    foreign_key: :sender_id,
    dependent: :destroy
  has_many :sending, through: :active_friends, source: :accepter
  has_many :passive_friends, class_name: Friend.name,
    foreign_key: :accepter_id,
    dependent: :destroy
  has_many :accepting, through: :passive_friends, source: :sender

  before_save :downcase_email

  validates :name, presence: true, length: {maximum: Settings.user.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.maximum_email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.minimum_password}, allow_nil: true
  mount_uploader :avatar, AvatarUploader

  scope :friend_of_user, ->(array_friends_id){where "id IN (?)", array_friends_id}
  scope :request_friends, ->(user_ids){where id: user_ids}
  scope :order_by_created_at, ->{order created_at: :desc}
  scope :status_admin, ->(status){where "is_admin = ?", status}

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def send_request_friend other_user
    sending << other_user
  end

  def is_friend? other_user
    sending.include?(other_user) || accepting.include?(other_user)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
