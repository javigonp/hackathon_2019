class SquadSerializer
  class << self
    def show(squad)
      {
        id: squad.id,
        name: squad.name,
        created_at: date_transform(squad.created_at),
        product_owner: user(squad.product_owner),
        scrum_master: user(squad.scrum_master),
        members: members(User.team_members(squad.id))
      }
    end

    def index(seller_appraisals)
      seller_appraisals.map { |message| show(message) }
    end

    private

    def date_transform(date)
      date.utc.iso8601(3)
    end

    def user(user)
      UserSerializer.show(user)
    end

    def members(users)
      users.map { |user| UserSerializer.show(user) }
    end
  end
end
