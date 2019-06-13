class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.user_id :integer
      t.title :string

      t.timestamps
    end
  end
end
