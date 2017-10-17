class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_disgets

      t.timestamps
      end

     create_table :user_connections, :force => true, :id => false do |t|
	  t.integer :user_a_id, :null => false
	  t.integer :user_b_id, :null => false
	
    end

  end
end
