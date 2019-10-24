class CreateUserSquadHistoryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_squad_history do |t|
      t.integer :user_id, null: false
      t.integer :squad_id, null: false
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.timestamps
    end
  end
end
