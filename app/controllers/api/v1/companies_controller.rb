class Api::V1::CompaniesController < ApplicationController

# ToDo apiとしてバッチ処理をすべきか検討
  def regularly_check_companies
    companies = Company.all
    companies.each do |company|
      company.save
    end
    render json: {}
  end

end
