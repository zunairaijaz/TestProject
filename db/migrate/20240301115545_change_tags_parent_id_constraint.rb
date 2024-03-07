class ChangeTagsParentIdConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column :tags, :parent_id, :integer, null: true
  end
end
