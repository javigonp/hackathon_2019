class AddPictureToSquad < ActiveRecord::Migration[5.0]
  def change
    add_column :squads, :picture_url, :string, null: true, default: nil
  end
end
