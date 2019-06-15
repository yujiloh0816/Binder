class List < ApplicationRecord
  has_many :inspections
  belongs_to :user
end
