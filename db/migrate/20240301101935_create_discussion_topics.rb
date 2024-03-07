class CreateDiscussionTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :discussion_topics do |t|
      t.string :title
      t.references :capaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
