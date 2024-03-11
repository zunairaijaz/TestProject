# app/controllers/campaigns_controller.rb
class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  # GET /campaigns
  def index
    @campaigns = Campaign.all
  end
  # GET /campaigns/1
  def show
    @campaign = Campaign.find(params[:id])
    @todo = @campaign.todos # Assuming you have a `todo` association in your `Campaign` model
  end
  # GET /campaigns/new
  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end
  # POST /campaigns
  def new
    @campaign = Campaign.new
    authorize @campaign
  end
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user # Associate the current user with the campaign
    authorize @campaign # Authorize create action
    if @campaign.save
      redirect_to @campaign, notice: 'Campaign Created Successfully.'
    else
      render :new
    end
  end
  def update
    @campaign = Campaign.find(params[:id])
    authorize @campaign # Authorize update action
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign Updated Successfully.'
    else
      render :edit
    end
  end
  # DELETE /campaigns/1
  def destroy
    @campaign = Campaign.find(params[:id])
    authorize @campaign # Authorize destroy action
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign Destroyed Successfully.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
    def authorize_user
      unless @campaign.user_id == current_user.id
        redirect_to campaigns_path(@campaign), alert: 'You are not authorized to perform this action.'
      end
    end
    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:title, :purpose, :estimated_duration, images: [])
    end

end
