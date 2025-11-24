class CreateMoneyCounts < ActiveRecord::Migration[8.1]
  def change
    create_table :money_counts do |t|
      t.string :unit, null: false

      t.timestamps
    end
  end
end
