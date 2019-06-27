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

require 'rails_helper'

RSpec.describe Reaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
