class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :location
      t.integer :position, null: true, default: nil
      t.string :slack_id, null: true, default: nil
      t.timestamps
    end
  end
end
