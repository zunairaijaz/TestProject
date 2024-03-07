class AddCampaignReferenceToDiscussionTopics < ActiveRecord::Migration[7.1]
  def change
    add_reference :discussion_topics, :campaign, null: false, foreign_key: true
  end
end
