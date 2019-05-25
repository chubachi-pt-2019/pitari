class AddUnderstandToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :understand, :integer
  end
end
