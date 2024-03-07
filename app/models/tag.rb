class Tag < ApplicationRecord
  belongs_to :parent, class_name: "Tag", optional: true
  has_many :sub_tags, class_name: "Tag", foreign_key: "parent_id", dependent: :destroy
  has_and_belongs_to_many :campaigns

  validates :name, presence: true

end
