class RemoveForeignKeyConstraintFromTags < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tags, :parents

  end
end
