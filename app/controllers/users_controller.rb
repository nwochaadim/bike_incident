class UsersController < ApplicationController
  def create
    User.create(signup_params)
  end

  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
