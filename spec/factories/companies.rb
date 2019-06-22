# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  domain     :string
#  img_site   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :company do
    name { "Binder株式会社" }
    domain { "https://binder.co.jp/" }
    img_name { "binder.png" }
  end
end
