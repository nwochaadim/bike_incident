module Api
  module V1

    class HomeController < ApplicationController
      def welcome
        render json: { message: "Welcome to v1 of the bike incident api" }
      end
    end

  end
end
