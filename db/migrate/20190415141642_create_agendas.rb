class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.string :name, null: false
      t.boolean :opinion, null: false

      t.timestamps
    end
  end
end
