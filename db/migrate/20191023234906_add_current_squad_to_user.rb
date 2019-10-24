class AddCurrentSquadToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_squad_id, :integer, null: true
  end
end
