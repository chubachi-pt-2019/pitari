class AddDiscussIdToAgenda < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM agendas;'
    add_reference :agendas, :discuss, null: false
  end
  def down
    remove_reference :agendas, :discuss, null: true
  end
end
