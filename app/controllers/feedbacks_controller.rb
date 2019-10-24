class FeedbacksController < ApplicationController
  before_action :set_user, only: [:create, :feedback_given, :feedback_received]

  def create
    puts 'TODO'
  end

  def show
    feedback = Feedback.find(params[:id])
    @serialized_feedback = FeedbackSerializer.show(feedback)
  end

  def feedback_given
    feedbacks = @user.feedbacks_given
    @serialized_feedbacks = FeedbackSerializer.index(feedbacks)
  end

  def feedback_received
    feedbacks = @user.feedbacks_received
    @serialized_feedbacks = FeedbackSerializer.index(feedbacks)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
