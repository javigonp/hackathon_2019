class CreateSquads < ActiveRecord::Migration[5.0]
  def change
    create_table :squads do |t|
      t.string :name
      t.integer :scrum_master_id, null: true
      t.integer :product_owner_id, null: true
      t.timestamps
    end
  end
end
