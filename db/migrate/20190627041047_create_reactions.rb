class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.integer :to_user_id
      t.integer :from_user_id
      t.integer :status
      
      t.timestamps
    end
  end
end
