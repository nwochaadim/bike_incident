require "rails_helper"

describe "User requests an incident", type: :request do
  describe "GET /api/v1/incidents/:id" do
    context "when logged in" do
      it "returns all the incidents" do
        signed_in_user_request :get, api_v1_incident_path(id: 1), params: {}

        expect(json_parsed_body["raw_body"]).to_not be_empty
      end

      it "returns a 200 http status code" do
        signed_in_user_request :get, api_v1_incident_path(id: 1), params: {}

        expect(response.status).to eq(200)
      end
    end

    context "when logged out" do
      it "displays an error message" do
        get api_v1_incident_path(id: 1)

        expect(json_parsed_body["errors"]).to be_present
      end

      it "returns a 401 http status" do
        get api_v1_incident_path(id: 1)

        expect(response.status).to eq(401)
      end
    end
  end

end
