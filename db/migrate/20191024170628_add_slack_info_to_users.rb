class AddSlackInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slack_name, :string, null: true, default: nil
  end
end
