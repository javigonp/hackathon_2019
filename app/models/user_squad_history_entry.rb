class UserSquadHistoryEntry < ApplicationRecord
  self.table_name = 'user_squad_history'

  belongs_to :user
  belongs_to :squad
end
