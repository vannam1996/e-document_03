class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :user

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :main_comment, ->{where reply_id: nil}
  scope :all_comment_replies, ->{where.not reply_id: nil}
  scope :comment_replies, ->(reply_id){where reply_id: reply_id}
end
