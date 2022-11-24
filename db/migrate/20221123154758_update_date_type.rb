class UpdateDateType < ActiveRecord::Migration[7.0]
  def change
    change_column :rents, :start_date, :datetime
    change_column :rents, :end_date, :datetime
  end
end
