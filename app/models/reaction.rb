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

class Reaction < ApplicationRecord
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"

  enum status: { good: 0, bad: 1 }

  scope :good_reaction_by, -> (user){ where(from_user: user, status: "good") }
  scope :search_matching_with, -> (user){ where(to_user: user, from_user: good_reaction_by(user).pluck(:to_user_id), status: "good") }
  
end
