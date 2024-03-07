class CreateJoinTableCampaignsTags < ActiveRecord::Migration[7.1]
  def change
    create_join_table :campaigns, :tags do |t|
      # t.index [:campaign_id, :tag_id]
      # t.index [:tag_id, :campaign_id]
    end
  end
end
