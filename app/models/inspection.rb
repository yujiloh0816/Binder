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

class Inspection < ApplicationRecord
  enum status: { good: 0, bad: 1 }

  belongs_to :company
  belongs_to :list

end
