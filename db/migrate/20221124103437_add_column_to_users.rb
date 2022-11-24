class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :zipcode, :integer
    add_column :users, :city, :string
  end
end
