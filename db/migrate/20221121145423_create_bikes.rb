class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :category
      t.string :brand
      t.boolean :status
      t.integer :price_per_day
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
