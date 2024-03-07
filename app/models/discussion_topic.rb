class DiscussionTopic < ApplicationRecord
  belongs_to :campaign
  has_many :comments, as: :commentable

  validates :title, presence: true

end
