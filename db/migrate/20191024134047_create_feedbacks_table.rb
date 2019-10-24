class CreateFeedbacksTable < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :text, null: false
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :rating, null: true
      t.integer :category, null: true, default: nil
      t.timestamps
    end
  end
end
