class AddActiveToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active, :boolean, null: false, default: false
  end
end
