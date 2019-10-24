class AddLeaderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :leader_id, :integer, null: true, default: nil
  end
end
