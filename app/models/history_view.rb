class HistoryView < ApplicationRecord
  belongs_to :document
  belongs_to :user

  scope :order_by_updated_at, ->{order updated_at: :desc}
end
