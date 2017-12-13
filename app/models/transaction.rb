class Transaction < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  scope :in_period, ->(time_start, time_end) do
    where("created_at BETWEEN ? AND ?",
      time_start, time_end)
  end
  scope :order_by_created_at, ->{order created_at: :desc}
  scope :status_confirm, ->(status){where "is_confirm = ?", status}
  scope :exception_user, ->(user_id){where "not user_id = ?", user_id}
end
