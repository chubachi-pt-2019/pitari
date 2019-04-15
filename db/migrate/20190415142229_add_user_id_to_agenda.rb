class AddUserIdToAgenda < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM agendas;'
    add_reference :agendas, :user, null: false
  end
  def down
    remove_reference :agendas, :user, null: true
  end
end
