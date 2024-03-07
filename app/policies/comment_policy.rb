# app/policies/comment_policy.rb

class CommentPolicy < ApplicationPolicy
  def destroy?
    # Only allow the comment's owner to destroy the comment
  record.user == user
  end
end
