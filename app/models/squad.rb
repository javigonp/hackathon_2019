class Squad < ApplicationRecord
  belongs_to :scrum_master, class_name: User, optional: true
  belongs_to :product_owner, class_name: User, optional: true

  has_many :users
end
