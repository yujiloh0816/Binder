class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.integer :list_id
      t.integer :company_id
      t.integer :status

      t.timestamps
    end
  end
end
