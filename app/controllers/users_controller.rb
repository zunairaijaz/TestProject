class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure user is authenticated

  def index
    @users = User.all
  end
  def update
    @user = User.find(params[:id])
    # Continue with updating status
    if current_user.expert? && @user.novice?
      if @user.update(user_params) # Exclude password parameter
        redirect_to users_path, notice: "User status updated successfully."
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        redirect_to users_path
      end
    else
      flash[:alert] = "Only expert users can update novice user's status."
      redirect_to users_path
    end
  end
  private
  def user_params
    params.require(:user).permit(:status)
  end
end
