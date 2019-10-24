class AddSlackHandleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_handle, :string, null: true, default: nil
  end
end
