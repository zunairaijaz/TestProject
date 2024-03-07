class RemoveCampaignReferenceFromDiscussionTopics < ActiveRecord::Migration[7.1]
  def change
    remove_column :discussion_topics, :capaign_id, :integer
  end
end
