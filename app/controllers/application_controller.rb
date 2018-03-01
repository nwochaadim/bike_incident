class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = [:name, :email, :password, :password_confirmation,
                                      :confirm_success_url].freeze
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: keys
    )
  end

end
