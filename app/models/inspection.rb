class Inspection < ApplicationRecord
  belongs_to :company
  belongs_to :list
end
