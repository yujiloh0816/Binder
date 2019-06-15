class Inspection < ApplicationRecord
  enum status: { good: 0, bad: 1 }

  belongs_to :company
  belongs_to :list

end
