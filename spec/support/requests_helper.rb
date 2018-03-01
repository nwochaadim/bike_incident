module RequestsHelper
  def login_user(email:, password:)
    params = { email: email, password: password }
    post user_session_path, params: params
    response_headers =  response.headers
    {
      "access-token": response_headers["access-token"],
      client: response_headers["client"],
      uid: response_headers["uid"]
    }
  end

  def json_parsed_body
    JSON.parse(response.body)
  end
end
