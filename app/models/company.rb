class Company < ApplicationRecord
  has_many :users
  has_many :inspections
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      company = self.find_or_initialize_by(domain: row["domain"])
      company.attributes = row.to_hash
      company.save!
    end
  end

end
