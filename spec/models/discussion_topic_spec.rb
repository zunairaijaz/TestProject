require 'rails_helper'

RSpec.describe DiscussionTopic, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    # it "ensures one_topic per_campaign" do
    #   campaign = Campaign.new(title: 'Test Campaign') # Persist the campaign to the database
    #   topic = DiscussionTopic.new(title: 'Topic Title', campaign: campaign)
    #   duplicate_topic = DiscussionTopic.new(title: 'Topic Title', campaign: campaign)

    #   duplicate_topic.valid?
    #   expect(duplicate_topic.errors[:base]).to include("You can only create one discussion topic per campaign.")
    # end
  end
  describe "associations" do
    it { should belong_to(:campaign) }
    it { should have_many(:comments) }
  end
end
