class IncidentFetcher

  def initialize(params)
    @query = params[:query]
    @id = params[:id]
  end

  def incident_results
    Unirest.get incidents_root_url,
                parameters: { occurred_after: occurred_after,
                              query: query },
                headers: { "Accept" => "application/json" }
  end

  def incident_result
    Unirest.get incident_url,
                headers: { "Accept" => "application/json" }
  end

  private

  attr_reader :query, :id

  def occurred_after
    return nil if query.present?
    yesterday_timestamp
  end

  def incidents_root_url
    ENV["BIKE_INCIDENTS_ROOT"]
  end

  def incident_url
    "#{incidents_root_url}/#{id}"
  end

  def yesterday_timestamp
    Date.yesterday.to_time.to_i
  end

end
