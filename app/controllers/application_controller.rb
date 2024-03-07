class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_in_path_for(resource_or_scope)
    if current_user.expert?
      campaigns_path
    elsif current_user.novice?
      # Redirect to the discussion topics page for qualified novice users
      # Replace 'discussion_topics_path' with the actual path to your discussion topics page
      campaigns_path
    else
      # Handle other cases or defaults here
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
