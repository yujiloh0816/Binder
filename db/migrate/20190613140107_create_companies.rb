class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :domain
      t.string :img_name
      t.integer :http_status

      t.timestamps
    end
  end
end
