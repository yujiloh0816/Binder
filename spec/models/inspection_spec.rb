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

require 'rails_helper'

RSpec.describe Inspection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
