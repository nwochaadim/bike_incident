module RequestsHelper
  def login_user(email:, password:)
    params = { email: email, password: password }
    post api_v1_user_session_path, params: params
    response_headers =  response.headers
    {
      "access-token": response_headers["access-token"],
      client: response_headers["client"],
      uid: response_headers["uid"]
    }
  end

  def signed_in_user_request(request_method, request_path, opts = {})
    user = create(:user, email: "test@test.com",
                         password: "password")
    credentials = login_user(email: "test@test.com", password: "password")
    opts.merge!(headers: credentials)
    send(request_method, request_path, opts)
  end

  def incidents_results_fixture
    { raw_body: [] }.to_json
  end

  def incident_result_fixture
    { incident: { id: 1, title: "Obstruction" } }.to_json
  end

  def latest_incidents_request_path
    "#{incidents_root}?occurred_after=#{yesterday_timestamp}&query"
  end

  def incidents_root
    ENV['BIKE_INCIDENTS_ROOT']
  end

  def yesterday_timestamp
    Date.yesterday.to_time.to_i
  end

  def json_parsed_body
    JSON.parse(response.body)
  end
end
