# app/policies/user_policy.rb
class UserPolicy < ApplicationPolicy
  def update_status?
    user.expert? && record.novice?
  end
end
