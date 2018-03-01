class HomeController < ApplicationController
  def welcome
    redirect_to api_v1_root_path
  end
end
