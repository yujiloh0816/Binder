# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  domain     :string
#  img_name   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  has_many :users
  has_many :inspections

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file, list_id)
    CSV.foreach(file.path, headers: true) do |row|
      domain = row["domain"].slice(/https?:\/\/[^\/]+\//)
      company = self.find_or_initialize_by(domain: domain)
      company.attributes = row.to_hash
      company.save!

      inspection = company.inspections.build
      inspection.list_id = list_id
      inspection.save!
    end
  end

end
