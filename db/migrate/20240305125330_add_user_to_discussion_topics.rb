class AddUserToDiscussionTopics < ActiveRecord::Migration[7.1]
  def change
    add_reference :discussion_topics, :user, foreign_key: true
  end
end
