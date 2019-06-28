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

  THUMBNAIL_SIZE = [400, 400]
  mount_uploader :img_name, ImgNameUploader

  before_validation :slice_domain
  before_save :check_http_status

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
      csv << column_names.values_at(0,1,2,4)
      all.each do |company|
        csv << company.attributes.values_at("id","name","domain","http_status")
      end
    end
  end

  private

    def slice_domain
      self.domain = self.domain.slice(VALID_DOMAIN_REGEX)
    end

    def check_http_status
      uri = URI.parse(self.domain)
      begin
        response = Net::HTTP.get_response(uri)
        if response.code == "200"
          self.http_status = "success"
        else
          self.http_status = "error"
        end
      rescue => e
        self.http_status = "error"
      end
    end

end
