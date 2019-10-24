class AddPictureUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :picture_url, :string, null: true, default: nil
  end
end
