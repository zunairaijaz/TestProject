# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_permitted_parameters, if: :devise_controller?




  # before_action :configure_account_update_params, only: [:update]
  def after_sign_up_path_for(resource)
    campaigns_path
  end


  protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params

    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :status, :user_type, :profession, :service])
   end
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:status])
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
