# == Schema Information
#
# Table name: chat_rooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatRoom < ApplicationRecord
  has_many :chat_messages
  has_many :chat_room_users
end
