class AddUnderstandToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :understand, :integer, default: 4
  end
end
