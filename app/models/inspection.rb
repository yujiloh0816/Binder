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

  after_update :create_reactions

  scope :only_backlog, -> (list_id){ where(list_id: list_id, status: nil)}
  # ToDo: companyと結合して http_statusを検索したい
  # companyモデルのscopeになる？
  # scope :only_backlog, -> (list_id){ includes(:company)where(list_id: list_id, status: nil, company: {http_status: "success"})}

  private

    def create_reactions
      current_user = self.list.user
      self.company.users.each do |user|
        reaction = Reaction.find_or_initialize_by(
          from_user_id: current_user.id,
          to_user_id: user.id
        )
        reaction.update_attributes(
          status: self.status
        )
      end
    end

end
