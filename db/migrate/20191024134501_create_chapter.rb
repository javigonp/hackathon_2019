class CreateChapter < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :name, null: true, default: nil
      t.string :picture_url, null: true, default: nil
      t.integer :chapter_lead_id, null: true, default: nil
      t.timestamps
    end
  end
end
