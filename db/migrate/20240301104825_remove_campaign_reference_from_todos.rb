class RemoveCampaignReferenceFromTodos < ActiveRecord::Migration[7.1]
  def change
    remove_column :todos, :campaign_id, :integer
  end
end
