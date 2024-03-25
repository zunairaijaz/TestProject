require 'rails_helper'
RSpec.describe CampaignsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "creates a new campaign" do
  #       campaign_params = FactoryBot.attributes_for(:campaign)
  #       puts campaign_params

  #       expect {
  #         post :create, params: { campaign: campaign_params }
  #       }.to change{Campaign.count}.by(1)
  #       expect(flash[:notice]).to eq('Campaign Created Successfully.')
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not create a new campaign" do
  #       expect {
  #         post :create, params: { campaign: { invalid_param: 'value' } }
  #       }.not_to change(Campaign, :count)

  #       expect(flash[:alert]).to eq("You are not authorized to perform this action.")
  #     end
  #   end
  # end
  describe "GET #show" do
    it "show template" do
      campaign=FactoryBot.create(:campaign)
      get :show , params: { id: campaign.id}
    end
  end
  describe "GET #edit" do
    it "edit template" do
      campaign=FactoryBot.create(:campaign)
      get :edit , params: {id: campaign.id}
    end
  end
  describe "PATCH #update" do
  it "updates campaign" do
    campaign = FactoryBot.create(:campaign)
    new_title = "Updated Title"

    patch :update, params: { id: campaign.id, campaign: { title: new_title } }

    campaign.reload

    expect(campaign.title).to eq(new_title)
    expect(flash[:notice]).to eq("Campaign Updated Successfully.")
  end
end
  describe "DELETE #destroy" do
    it "destroys campaign" do
      campaign = FactoryBot.create(:campaign)
      expect { delete :destroy, params: {id: campaign.id}}
    end
  end
end
