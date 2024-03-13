class TodoPolicy < ApplicationPolicy

  def new?
   can_create_todo?
  end

  private
    def can_create_todo?
      @record.campaign.todos.where(campaign_id: @record.campaign.id).empty?
    end



end
