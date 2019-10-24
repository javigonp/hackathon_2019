class FeedbacksController < ApplicationController
  before_action :set_user, only: [:create, :feedback_given, :feedback_received]

  def create
    feedback = Feedback(create_params)
    @serialized_feedback = FeedbackSerializer.show(feedback)
    render 'show'
  end

  def show
    feedback = Feedback.find(params[:id])
    @serialized_feedback = FeedbackSerializer.show(feedback)
  end

  def feedback_given
    feedbacks = @user.feedbacks_given
    @serialized_feedbacks = FeedbackSerializer.index(feedbacks)
    render 'index'
  end

  def feedback_received
    feedbacks = @user.feedbacks_received
    @serialized_feedbacks = FeedbackSerializer.index(feedbacks)
    render 'index'
  end

  private

  def create_params
    params.require(:feedback).permit(:text, :sender_id, :receiver_id, :rating, :category)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
