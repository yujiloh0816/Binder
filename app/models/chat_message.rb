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

class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
end
