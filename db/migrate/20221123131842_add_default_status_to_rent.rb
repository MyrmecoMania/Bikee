class AddDefaultStatusToRent < ActiveRecord::Migration[7.0]
  def change
    change_column :rents, :status, :string, default: "waiting"
  end
end
