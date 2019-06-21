# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  img_name               :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  self_introduction      :string
#  string                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it "メールアドレスとパスワードとカンパニーIDがあれば有効" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "カンパニーIDがなくても有効" do
    expect(FactoryBot.build(:user, company_id: nil)).to be_valid
  end

  it "メールアドレスがなければ無効" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスなら無効" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "パスワードが5文字以下であれば無効" do
    user = FactoryBot.build(:user, password: "foo")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "カンパニーとのアソシエーション(belongs_to)の確認" do
    company = FactoryBot.create(:company, name: "Binder株式会社")
    user = FactoryBot.create(:user, company_id: company.id)
    expect(user.company.name).to eq "Binder株式会社"
  end
end
