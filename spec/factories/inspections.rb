# == Schema Information
#
# Table name: inspections
#
#  id         :integer          not null, primary key
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  list_id    :integer
#

FactoryBot.define do
  factory :inspection do
    integer { "" }
    integer { "" }
    integer { "" }
  end
end
