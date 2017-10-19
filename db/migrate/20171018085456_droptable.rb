class Droptable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :message_receives
  	drop_table :message_sends

  	drop_table :receive_messages
  	drop_table :send_messages

  end
end
