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

  def latest_incidents_fixture
    { raw_body: [] }.to_json
  end

  def latest_incidents_request_path
    "#{ENV['BIKE_INCIDENTS_ROOT']}?occurred_after=#{yesterday_timestamp}"
  end

  def yesterday_timestamp
    Date.yesterday.to_time.to_i
  end

  def json_parsed_body
    JSON.parse(response.body)
  end
end
