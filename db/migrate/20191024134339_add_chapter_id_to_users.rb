class AddChapterIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :chapter_id, :integer, null: true, default: true
  end
end
