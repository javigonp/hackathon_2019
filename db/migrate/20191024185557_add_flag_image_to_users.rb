class AddFlagImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :flag_url, :string, null: true, default: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-uruguay_1f1fa-1f1fe.png'
  end
end
