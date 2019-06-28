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

require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
