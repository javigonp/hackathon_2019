class Chapter < ApplicationRecord
  belongs_to :chapter_lead, class_name: User, optional: true

  has_many :users
end
