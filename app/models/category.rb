class Category < ApplicationRecord
  belongs_to :user
  has_many :documents, dependent: :destroy

  before_save :downcase_style

  validates :style, presence: true,
    length: {maximum: Settings.category.maximum_style},
    uniqueness: true

  def downcase_style
    self.style = style.downcase
  end
end
