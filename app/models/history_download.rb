class HistoryDownload < ApplicationRecord
  belongs_to :document
  belongs_to :user

  scope :in_period, ->(time_start, time_end) do
    where("created_at BETWEEN ? AND ?",
      time_start, time_end)
  end
end
