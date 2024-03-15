require 'rails_helper'
RSpec.describe CampaignsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end

  describe "POST #create" do
    it "valid attributes create new campaign" do
      campaign_params = FactoryBot.attributes_for(:campaign)
      post :create, params: { campaign: campaign_params }

    end
  end
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
   it "update campaign" do
     campaign=FactoryBot.create(:campaign)
     new_title = "Updated Title"

     patch :update , params: {id: campaign.id , campaign: {title: new_title}}
     campaign.reload
    end
  end
  describe "DELETE #destroy" do
    it "destroys campaign" do
      campaign = FactoryBot.create(:campaign)
      expect { delete :destroy, params: {id: campaign.id}}
    end
  end
end
