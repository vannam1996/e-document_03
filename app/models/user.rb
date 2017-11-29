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
end
