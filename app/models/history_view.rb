class HistoryView < ApplicationRecord
  belongs_to :document
  belongs_to :user
end
