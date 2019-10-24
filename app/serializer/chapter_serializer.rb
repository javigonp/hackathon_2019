class ChapterSerializer
  class << self
    def show(chapter)
      {
        id: chapter.id,
        name: chapter.name,
        members: chapter_members(chapter.members_without_leader),
        leader: UserSerializer.show(chapter.chapter_lead)
      }
    end

    def index(chapters)
      chapters.map { |chapter| show(chapter) }
    end

    private

    def chapter_members(members)
      UserSerializer.index(members)
    end
  end
end
