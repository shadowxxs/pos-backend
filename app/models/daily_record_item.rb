class DailyRecordItem < ApplicationRecord
  belongs_to :daily_record
  belongs_to :money_count
end
