class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.name :string
      t.domain :string
      t.img_name :string

      t.timestamps
    end
  end
end
