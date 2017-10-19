class AddColumnMessageIdToMessageRandS < ActiveRecord::Migration[5.1]
  def change
  	add_column :message_receives , :message_id, :integer
  	add_column :message_sends, :message_id, :integer
  end
end
