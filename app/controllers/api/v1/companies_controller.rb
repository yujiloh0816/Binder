class Api::V1::CompaniesController < ApplicationController

  def check_http_status
    companies = Company.all
    companies.each do |company|
      uri = URI.parse(company.domain)
      response = Net::HTTP.get_response(uri)
      if response.code == "200"
        company.http_status = "success"
      else
        company.http_status = "error"
      end
      company.save
    end
    render json: {}
  end

end
