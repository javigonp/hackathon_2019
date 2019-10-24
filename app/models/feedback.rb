class Feedback < ApplicationRecord
  belongs_to :sender, class_name: User, optional: false
  belongs_to :receiver, class_name: User, optional: false

  enum position: ['Quality of Work', 'Quantity of Work', 'Dependability', 'Professionalism']

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
