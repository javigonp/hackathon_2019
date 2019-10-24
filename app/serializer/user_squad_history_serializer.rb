class UserSquadHistorySerializer
  class << self
    def show(history_entry)
      {
        id: history_entry.id,
        squad: SquadSerializer.show(history_entry.squad),
        date_from: date_transform(history_entry.date_from),
        date_to: date_transform(history_entry.date_to),
        created_at: date_transform(history_entry.created_at),
        updated_at: date_transform(history_entry.updated_at)
      }
    end

    def index(records)
      records.map { |record| show(record) }
    end

    private

    def date_transform(date)
      date.utc.iso8601(3)
    end
  end
end
