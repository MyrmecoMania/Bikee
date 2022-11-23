class ChangeStatusColumnBikes < ActiveRecord::Migration[7.0]
  def change
    change_column :bikes, :status, :boolean, default: true
  end
end
