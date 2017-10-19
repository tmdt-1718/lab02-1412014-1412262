class CreateRelationshipRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :relationship_requests do |t|
      t.integer :receiver
      t.integer :user_id

      t.timestamps
    end
  end
end
