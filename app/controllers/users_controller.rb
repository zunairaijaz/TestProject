# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure user is authenticated

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

    if current_user.expert? && @user.novice?
      if @user.update_columns(status: params[:user][:status])
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
end
