class CreateAreasTable < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :picture, null: true, default: nil
      t.string :name, null: false
      t.timestamps
    end
  end
end
