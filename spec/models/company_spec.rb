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

require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "csvファイルのimport #self.import(file, list_id)" do

    context "正常系" do

      xit "Companyモデルの作成時にInspectionモデルも作成されること" do
        company = FactoryBot.create(:company)
        list = FactoryBot.create(:list)

        inspection = FactoryBot.create(:company)
      end

      it "domainカラムがdomain以降の文字列を削除し登録されること" do
        company = FactoryBot.create(:company, domain: "https://binder.co.jp/users/")
        expect(company.domain).to eq "https://binder.co.jp/"
      end

      it "domainのフォーマットが正しいこと" do
        expect(FactoryBot.build(:company, domain: "https://binder.co.jp/users/")).to be_valid
      end


    end

    context "異常系" do

      it "domainのフォーマットが正しくないこと" do
        company = FactoryBot.build(:company, domain: "htps://binder.co.jp/users/")
        company.valid?
        expect(company.errors[:domain]).to include("is invalid")
      end

      it "domainカラムがユニークであること" do
        FactoryBot.create(:company, domain: "https://binder.co.jp/")
        company = FactoryBot.build(:company,domain: "https://binder.co.jp/")
        company.valid?
        expect(company.errors[:domain]).to include("has already been taken")
      end
    end

  end

end
