class DiscussionTopicsController < ApplicationController
  before_action :set_campaign
  before_action :set_discussion_topic, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def show
    @discussion_topic = DiscussionTopic.find(params[:id])
    @commentable = @discussion_topic
  end


  # GET /campaigns/:campaign_id/discussion_topics/:id/edit
  def edit
  end
  def index
    @discussion_topics = @campaign.discussion_topics
  end
  # PATCH /campaigns/:campaign_id/discussion_topics/:id
  def update
    if @discussion_topic.update(discussion_topic_params)
      redirect_to campaign_discussion_topic_path(@campaign, @discussion_topic), notice: 'Discussion topic was successfully updated.'
    else
      render :edit
    end
  end
  def new
    @discussion_topic = @campaign.discussion_topics.build
  end
  # POST /campaigns/:campaign_id/discussion_topics
 # app/controllers/discussion_topics_controller.rb
def create
  @discussion_topic = @campaign.discussion_topics.build(discussion_topic_params)
  @discussion_topic.user_id = current_user.id
  if @discussion_topic.save
    redirect_to campaign_discussion_topics_path(@campaign), notice: 'Discussion topic was successfully created.'
  else
    render :new
  end
end
  # DELETE /campaigns/:campaign_id/discussion_topics/:id
  def destroy
    @discussion_topic.destroy
    redirect_to campaign_discussion_topics_path(@campaign), notice: 'Discussion topic was successfully destroyed.'
  end
  private
  def set_campaign
    @campaign = Campaign.find_by(id: params[:campaign_id])
    unless @campaign
      flash[:alert] = 'Campaign not found'
      redirect_to campaigns_path
    end
  end

  def set_discussion_topic
    @discussion_topic = @campaign.discussion_topics.find(params[:id])
  end
  def authorize_user
    unless @discussion_topic.user_id == current_user.id
      redirect_to campaign_discussion_topic_path(@campaign, @discussion_topic), alert: 'You are not authorized to perform this action.'
    end
  end
  def discussion_topic_params
    params.require(:discussion_topic).permit(:title, :description)
  end
end
