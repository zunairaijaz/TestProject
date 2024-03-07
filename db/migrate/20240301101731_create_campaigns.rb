class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :purpose
      t.string :estimated_duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
