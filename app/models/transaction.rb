class Transaction < ApplicationRecord
  belongs_to :user

  scope :in_period, ->(time_start, time_end) do
    where("created_at BETWEEN ? AND ?",
      time_start, time_end)
  end
  scope :order_by_created_at, ->{order created_at: :desc}
  scope :status_confirm, ->(status){where "is_confirm = ?", status}
end
