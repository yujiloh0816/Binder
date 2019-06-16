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

require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "csvファイルのimport #self.import(file, list_id)" do

    context "正常系" do
      it "一行目のheaderが登録されていれること" do
        
      end
      it "一行目のheaderのcolumn_namesの形式が正しいこと"
      it "二行目以降のcolumn_namesの形式が正しいこと"
      it "Companyモデルの作成時にInspectionモデルも作成されること"
      it "Inspectionモデルがcompany_idとlist_idを持つこと"
      it "domainカラムがdomain以降の文字列を削除し登録されること"
      it "domainカラムがユニークであること"
    end

    context "異常系" do
      it "一行目のheaderが登録されていれること"
      it "一行目のheaderのcolumn_namesの形式が正しいこと"
      it "二行目以降のcolumn_namesの形式が正しいこと"
      it "Companyモデルの作成時にInspectionモデルも作成されること"
      it "Inspectionモデルがcompany_idとlist_idを持つこと"
      it "domainカラムがdomain以降の文字列を削除し登録されること"
      it "domainカラムがユニークであること"
    end

  end

  describe "csvファイルのexport #self.to_csv" do

    context "正常系" do
      it "ファイルがexportされること"
      it "一行目のheaderがid,domain,nameであること"
      it "行頭のheaderを除きレコードの数と行数が同一であるること"
    end

    context "異常系" do
      it "ファイルがexportされること"
      it "一行目のheaderがid,domain,nameであること"
      it "行頭のheaderを除きレコードの数と行数が同一であるること"
    end

  end

end
