# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :search
  # before_action :configure_sign_in_params, only: [:create]
def after_sign_in_path_for(resource)
    admin_orders_path(order_sort: 0)
end

def after_sign_out_path_for(resource)
    new_admin_session_path
end
  # GET /rerails source/sign_in
  # def new_
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
