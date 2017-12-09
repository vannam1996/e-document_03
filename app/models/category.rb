class Category < ApplicationRecord
  belongs_to :user
  has_many :documents, dependent: :destroy

  before_save :downcase_style

  validates :style, presence: true,
    length: {maximum: Settings.category.maximum_style},
    uniqueness: true

  scope :order_by_updated_at, ->{order updated_at: :desc}

  def downcase_style
    self.style = style.downcase
  end
end
