class CreateMessageSends < ActiveRecord::Migration[5.1]
  def change
    create_table :message_sends do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
