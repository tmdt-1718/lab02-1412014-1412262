class CreateMessageReceives < ActiveRecord::Migration[5.1]
  def change
    create_table :message_receives do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
