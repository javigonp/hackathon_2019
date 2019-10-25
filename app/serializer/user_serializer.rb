class UserSerializer
  class << self
    def show(user)
      return unless user.present?
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        created_at: date_transform(user.created_at),
        email: user.email,
        position: user.position,
        picture_url: user.picture_url,
        leader: leader_info(user.lead),
        squad: squad(user.current_squad),
        chapter: chapter(user.chapter),
        slack_id: user.slack_id,
        slack_name: user.slack_name,
        flag_url: user.flag_url
      }
    end

    def index(users)
      users.map { |user| show(user) }
    end

    def leader_info(leader)
      return unless leader.present?
      {
        id: leader.id,
        first_name: leader.first_name,
        last_name: leader.last_name,
      }
    end

    def chapter(chapter)
      return unless chapter.present?
      {
        id: chapter.id,
        name: chapter.name
      }
    end

    def squad(squad)
      return unless squad.present?
      {
        id: squad.id,
        name: squad.name
      }
    end

    private

    def date_transform(date)
      date.utc.iso8601(3)
    end
  end
end