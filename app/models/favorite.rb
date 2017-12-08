class Favorite < ApplicationRecord
  belongs_to :document
  belongs_to :user

  scope :status_favorite, ->(status){where "is_favorite = (?)", status}
  scope :order_by_created_at, ->{order created_at: :desc}
end
