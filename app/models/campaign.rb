# app/models/campaign.rb
class Campaign < ApplicationRecord

  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :discussion_topics, dependent: :destroy
  has_many :comments, as: :commentable
  has_and_belongs_to_many :tags
  has_many_attached :images

  validates :title, :purpose, :estimated_duration, presence: true
  validates :estimated_duration, inclusion: { in: ['within 1 week', 'within 1 month', 'within 3 months'] }

end
