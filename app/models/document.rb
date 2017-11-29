class Document < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :history_downloads, dependent: :destroy

  scope :order_by_created_at, ->{order created_at: :desc}
end
