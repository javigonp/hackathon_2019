class FeedbackSerializer
  class << self
    def show(feedback)
      {
        id: feedback.id,
        sender: UserSerializer.show(feedback.sender),
        receiver: UserSerializer.show(feedback.receiver),
        rating: feedback.rating,
        category: feedback.category,
        created_at: date_transform(feedback.created_at),
        updated_at: date_transform(feedback.updated_at)
      }
    end

    def index(feedbacks)
      feedbacks.map { |feedback| show(feedback) }
    end

    private

    def date_transform(date)
      date.utc.iso8601(3)
    end
  end
end
