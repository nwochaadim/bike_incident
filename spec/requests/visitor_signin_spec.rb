require "rails_helper"

describe "visitor sign in", type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe "POST /auth/signin" do
    context "with valid credentials" do
      it "returns the user information" do
        user = create(:user, email: "test@test.com",
                             password: "password")
        params = { email: "test@test.com", password: "password" }

        post user_session_path, params: params, headers: headers

        expect(json_parsed_body["data"]).to be_present
      end

      it "returns the access-token in the response header" do
        user = create(:user, email: "test1@test.com",
                             password: "password")
        params = { email: "test1@test.com", password: "password" }

        post user_session_path, params: params, headers: headers

        headers = response.headers
        expect(headers["access-token"]).to be_present
      end
    end

    context "with invalid credentials" do
      it "returns a 401 response status" do
        user = create(:user, email: "test@test.com",
                             password: "password")
        params = { email: "test@test.com", password: "wrong-password" }

        post user_session_path, params: params, headers: headers

        expect(response.status).to eq(401)
      end

      it "returns an error message" do
        user = create(:user, email: "test@test.com",
                             password: "password")
        params = { email: "test@test.com", password: "wrong-password" }

        post user_session_path, params: params, headers: headers

        expect(json_parsed_body["errors"]).to be_present
      end
    end
  end
end
