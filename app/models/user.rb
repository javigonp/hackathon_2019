class User < ApplicationRecord
  has_many :squads
  belongs_to :current_squad, class_name: Squad, optional: true

  enum position: ['QA', 'Backend Engineer', 'Android Engineer', 'iOS Engineer', 'UI Engineer', 'Product Owner']

end
