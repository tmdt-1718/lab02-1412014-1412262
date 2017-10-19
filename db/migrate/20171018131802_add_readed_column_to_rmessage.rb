class AddReadedColumnToRmessage < ActiveRecord::Migration[5.1]
  def change
  	add_column :rmessages, :readed , :bool
  end
end
