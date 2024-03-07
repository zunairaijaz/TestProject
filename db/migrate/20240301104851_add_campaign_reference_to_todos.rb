class AddCampaignReferenceToTodos < ActiveRecord::Migration[7.1]
  def change
    add_reference :todos, :campaign, null: false, foreign_key: true
  end
end
