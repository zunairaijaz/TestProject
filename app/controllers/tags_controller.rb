class TagsController < ApplicationController
  before_action :set_campaign, only: [:index, :new, :create, :edit, :update, :destroy]

  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def show
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @tag = @campaign.tags.build(tag_params)
    if @tag.save
      redirect_to campaign_path(@campaign), notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  def edit
  end
  def update
    @tag = Tag.find(params[:id])
    @campaign = @tag.campaigns
    if @tag.update(tag_params)
      redirect_to campaign_tags_path(@campaign), notice: 'Tag updated successfully!'
    else
      render :edit
    end
  end



  def destroy
    @tag = Tag.find(params[:id])
    @campaign = @tag.campaigns
    @tag.destroy
    redirect_to campaign_tags_path(@campaign), notice: 'Tag deleted successfully!'
  end


  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
