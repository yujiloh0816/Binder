# == Schema Information
#
# Table name: chat_room_users
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :integer
#  user_id      :integer
#

FactoryBot.define do
  factory :chat_room_user do
    
  end
end
