class AddDiscussIdToUser < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM users;'
    add_reference :users, :discuss, null: false
  end
  def down
    remove_reference :users, :discuss, null: true
  end
end
