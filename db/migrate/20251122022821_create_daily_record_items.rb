class CreateDailyRecordItems < ActiveRecord::Migration[8.1]
  def change
    create_table :daily_record_items do |t|
      t.references :daily_record, null: false, foreign_key: true
      t.references :money_count, foreign_key: true
      t.integer :count, null: false, default: 0

      t.timestamps
    end
  end
end
