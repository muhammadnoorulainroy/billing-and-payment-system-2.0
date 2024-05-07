# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource.type
    when 'Admin'
      admin_root_path
    when 'Buyer'
      buyer_root_path
    end
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :type, :image) }
    devise_parameter_sanitizer.permit(:accept_invitation,
                                      keys: %i[name password password_confirmation type image])
  end

  private

  def record_not_found
    flash[:error] = 'Something went wrong. Please try again.'
    redirect_to request.referer || root_path
  end

  def user_not_authorized
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to request.referer || root_path
  end

  def invalid_foreign_key
    flash[:error] = 'Cannot perform this action at the moment'
    redirect_to request.referer || root_path
  end
end
