class IncidentFetcher

  def latest_incidents
    Unirest.get incident_root_url,
                parameters: { occurred_after: yesterday_timestamp },
                headers: { "Accept" => "application/json" }
  end

  private

  def incident_root_url
    ENV["BIKE_INCIDENTS_ROOT"]
  end

  def yesterday_timestamp
    Date.yesterday.to_time.to_i
  end
end
