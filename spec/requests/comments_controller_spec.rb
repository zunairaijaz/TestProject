require 'rails_helper'
RSpec.describe "CommentsControllers", type: :request do
  include Devise::Test::IntegrationHelpers  # Include Devise test helpers

  let(:user) { FactoryBot.create(:user) }
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:discussion_topic) { FactoryBot.create(:discussion_topic, campaign: campaign) }
  let(:comment_params) { FactoryBot.attributes_for(:comment) }

  before(:each) do
    sign_in user  # Sign in the user without specifying authentication token
  end

  describe "POST #create" do
    it "creates a comment" do
      post "/campaigns/#{campaign.id}/comments", params: { comment: comment_params }
      expect(flash[:notice]).to eq('Comment Created Successfully!')
    end

    it "creates comments for discussion topic" do
      post "/campaigns/#{campaign.id}/discussion_topics/#{discussion_topic.id}/comments", params: { discussion_topic_id: discussion_topic.id, comment: comment_params }
      expect(flash[:notice]).to eq('Comment Created Successfully!')

    end
  end
  describe "DELETE #destroy" do
  let(:comment) { FactoryBot.create(:comment, commentable: campaign, user: user) }

    it "deletes comment" do
      delete "/comments/#{comment.id}"
      # expect(flash[:notice]).to eq('Comment Deleted Successfully!')

    end
  end
end
