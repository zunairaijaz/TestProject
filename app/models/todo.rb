class Todo < ApplicationRecord
  belongs_to :campaign

  validates :title, :description, presence: true

end
