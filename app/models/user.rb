class User < ApplicationRecord
  has_many :squads
  belongs_to :current_squad, class_name: Squad, optional: true
  belongs_to :chapter, class_name: Chapter, optional: true

  enum position: ['QA', 'Backend Engineer', 'Android Engineer', 'iOS Engineer', 'FE Engineer', 'Product Owner']

  def self.team_members(squad_id)
    User.where(current_squad_id: squad_id).where.not(position: 5)
  end
end
