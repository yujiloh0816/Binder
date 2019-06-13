class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.list_id :integer
      t.company_id :integer
      t.status :integer

      t.timestamps
    end
  end
end
