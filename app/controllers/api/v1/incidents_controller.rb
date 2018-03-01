module Api
  module V1

    class IncidentsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        render json: incidents_results, status: :ok
      end

      def show
        render json: incident_result, status: :ok
      end

      private

      def incidents_results
        incident_fetcher.incident_results
      end

      def incident_result
        incident_fetcher.incident_result
      end

      def incident_fetcher
        IncidentFetcher.new(params)
      end
    end

  end
end
