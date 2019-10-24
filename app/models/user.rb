class User < ApplicationRecord
  has_many :squads
  belongs_to :current_squad, class_name: Squad, optional: true
end
