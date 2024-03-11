class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable
  before_action :set_campaign
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to redirect_path, notice: 'Comment Created Successfully!'
    else
      flash.now[:alert] = 'Failed to create comment.'
      redirect_to redirect_path
    end
  end
  def destroy
    authorize @comment
    @comment.destroy
    redirect_to redirect_path, notice: 'Comment Deleted Successfully!'
  end
  private
  def set_commentable
    if params[:discussion_topic_id]
      @commentable = DiscussionTopic.find(params[:discussion_topic_id])
    elsif params[:campaign_id]
      @commentable = Campaign.find(params[:campaign_id])
    else
      redirect_to root_path, alert: 'Invalid commentable.'
    end
  end
  def set_campaign
    @campaign = Campaign.find(params[:campaign_id]) if @commentable.is_a?(DiscussionTopic) && params[:campaign_id]
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:title)
  end
  def redirect_path
    if @commentable.is_a?(DiscussionTopic)
      campaign_path(@commentable)
    elsif @commentable.is_a?(Campaign)
      campaign_path(@commentable)
    else
      root_path
    end
  end
end
