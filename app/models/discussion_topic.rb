class DiscussionTopic < ApplicationRecord
  belongs_to :campaign
  has_many :comments, as: :commentable

  validates :title, presence: true
  validate :one_topic_per_user_per_campaign

  private
  def one_topic_per_user_per_campaign
    if DiscussionTopic.where(user_id: user_id, campaign_id: campaign_id).exists?
      errors.add(:base, "You can only create one discussion topic per campaign.")
    end
  end
end
