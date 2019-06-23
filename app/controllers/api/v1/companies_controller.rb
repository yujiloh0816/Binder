class Api::V1::CompaniesController < ApplicationController

  def check_http_status
    companies = Company.all
    companies.each do |company|
      uri = URI.parse(company.domain)
      begin
        response = Net::HTTP.get_response(uri)
        if response.code == "200"
          company.http_status = "success"
        else
          company.http_status = "error"
        end
        company.save
      rescue => e
        company.http_status = "error"
        company.save
      end
    end
    render json: {}
  end

end
