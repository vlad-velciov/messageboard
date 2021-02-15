class CreateMessageNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :message_notifications do |t|
      t.integer :user_id
      t.integer :message_id
      t.boolean :read, default: false

      t.timestamps
    end

    add_index :message_notifications, :user_id
  end
end
