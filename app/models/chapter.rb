class Chapter < ApplicationRecord
  belongs_to :chapter_lead, class_name: User, optional: true

  has_many :users

  def members_without_leader
    users.where.not(id: chapter_lead_id)
  end
end
