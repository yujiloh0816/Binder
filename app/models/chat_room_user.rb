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

class ChatRoomUser < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
end
