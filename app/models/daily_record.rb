class DailyRecord < ApplicationRecord
  enum type: {
    clock_in: 0,
    clock_out: 1
  }

  has_many :daily_record_items, dependent: :destroy
  has_many :money_counts, through: :daily_record_items
end
