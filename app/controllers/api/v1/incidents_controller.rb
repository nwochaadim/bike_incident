module Api
  module V1

    class IncidentsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        render json: most_recent_incidents, status: :ok
      end

      private

      def most_recent_incidents
        IncidentFetcher.new.latest_incidents
      end
    end

  end
end
