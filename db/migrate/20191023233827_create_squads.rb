class CreateSquads < ActiveRecord::Migration[5.0]
  def change
    create_table :squads do |t|
      t.string :name
      t.integer :scrum_master_id
      t.integer :product_owner_id
      t.timestamps
    end
  end
end
