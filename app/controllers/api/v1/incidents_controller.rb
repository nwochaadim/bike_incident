module Api
  module V1

    class IncidentsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        render json: incident_results, status: :ok
      end

      private

      def incident_results
        IncidentFetcher.new(params).incident_results
      end
    end

  end
end
