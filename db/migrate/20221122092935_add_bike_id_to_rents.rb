class AddBikeIdToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :bike, null: false, foreign_key: true
  end
end
