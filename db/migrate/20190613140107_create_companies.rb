class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :domain
      t.string :img_site

      t.timestamps
    end
  end
end
