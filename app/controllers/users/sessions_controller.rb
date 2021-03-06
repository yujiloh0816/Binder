# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end
  #
  # # POST /resource/sign_in
  # def create
  #   super
  # end
  #
  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def after_sign_in_path_for(resource)
     request.user_agent.include?('Mobile') ? users_sp_lists_path : users_pc_lists_path
  end


  def after_sign_out_path_for(resource_or_root)
    request.user_agent.include?('Mobile') ? users_sp_root_path : users_pc_lists_path
  end
end
