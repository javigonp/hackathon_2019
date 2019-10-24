class UserSerializer
  class << self
    def show(user)
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        created_at: date_transform(user.created_at),
        email: user.email,
        position: user.position
      }
    end

    def index(users)
      users.map { |user| show(user) }
    end

    private

    def date_transform(date)
      date.utc.iso8601(3)
    end
  end
end