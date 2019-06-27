# == Schema Information
#
# Table name: reactions
#
#  id           :integer          not null, primary key
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  from_user_id :integer
#  to_user_id   :integer
#

FactoryBot.define do
  factory :reaction do
    
  end
end
