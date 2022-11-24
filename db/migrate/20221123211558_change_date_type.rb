class ChangeDateType < ActiveRecord::Migration[7.0]
  def change
    change_column :rents, :start_date, :date
    change_column :rents, :end_date, :date
  end
end
