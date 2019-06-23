# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  domain      :string
#  http_status :integer
#  img_name    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ApplicationRecord
  include Constants

  enum http_status: { success: 0, error: 1 }

  has_many :users
  has_many :inspections

  THUMBNAIL_SIZE = [50, 50]
  mount_uploader :img_name, ImgNameUploader

  before_validation :slice_domain
  validates :domain, uniqueness: true, format: { with: VALID_DOMAIN_REGEX }

  def self.import(file, list_id)
    CSV.foreach(file.path, headers: true) do |row|
      domain = row["domain"].slice(VALID_DOMAIN_REGEX)
      company = self.find_or_initialize_by(domain: domain)
      company.attributes = row.to_hash
      company.save!

      inspection = company.inspections.build
      inspection.list_id = list_id
      inspection.save!
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end

  private

    def slice_domain
      self.domain = self.domain.slice(VALID_DOMAIN_REGEX)
    end

end
