class Chapter < ApplicationRecord
  belongs_to :chapter_lead, class_name: User, optional: true

  has_many :users

  def members_without_leader
    puts name
    puts '----'
    puts chapter_lead_id
    puts '----'
    puts users.count
    users.where.not(id: chapter_lead_id)
  end
end
