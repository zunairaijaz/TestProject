class CampaignPolicy < ApplicationPolicy
  def create?
    user.expert? # Only allow expert users to create campaigns
  end

  def update?
    user.expert? # Only allow expert users to edit campaigns
  end

  def destroy?
    user.expert? # Only allow expert users to delete campaigns
  end
end
