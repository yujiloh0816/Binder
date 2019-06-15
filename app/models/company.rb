class Company < ApplicationRecord
  has_many :users
  has_many :inspections

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
