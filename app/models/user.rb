class User < ApplicationRecord
  belongs_to :current_squad, class_name: Squad, optional: true
  belongs_to :chapter, class_name: Chapter, optional: true

  has_many :squads
  has_many :feedbacks_given, class_name: Feedback, foreign_key: :sender_id
  has_many :feedbacks_received, class_name: Feedback, foreign_key: :receiver_id

  enum position: ['QA', 'Backend Engineer', 'Android Engineer', 'iOS Engineer', 'FE Engineer', 'Product Owner']

  def self.team_members(squad_id)
    User.where(current_squad_id: squad_id).where.not(position: 5)
  end
end
