class IncidentFetcher

  def initialize(params)
    @query = params[:query]
  end

  def incident_results
    Unirest.get incident_root_url,
                parameters: { occurred_after: occurred_after,
                              query: query },
                headers: { "Accept" => "application/json" }
  end

  private

  attr_reader :query

  def occurred_after
    return nil if query.present?
    yesterday_timestamp
  end

  def incident_root_url
    ENV["BIKE_INCIDENTS_ROOT"]
  end

  def yesterday_timestamp
    Date.yesterday.to_time.to_i
  end

end
