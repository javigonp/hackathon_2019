class Squad < ApplicationRecord
  belongs_to :scrum_master, class_name: User
  belongs_to :product_owner, class_name: User
end
