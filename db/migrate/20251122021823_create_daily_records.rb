class CreateDailyRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :daily_records do |t|
      t.integer :type, null: false
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
