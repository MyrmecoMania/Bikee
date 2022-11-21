class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.decimal :total_price
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :bike_id, foreign_key: true
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
