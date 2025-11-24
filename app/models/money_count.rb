class MoneyCount < ApplicationRecord
  has_many :daily_record_items
  has_many :daily_records, through: :daily_record_items
end
