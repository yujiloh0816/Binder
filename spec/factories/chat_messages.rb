# == Schema Information
#
# Table name: chat_messages
#
#  id           :integer          not null, primary key
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :integer
#  user_id      :integer
#

FactoryBot.define do
  factory :chat_message do
    
  end
end
