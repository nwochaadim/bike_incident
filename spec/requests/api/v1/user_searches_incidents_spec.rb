require "rails_helper"

describe "User searches incidents" do

  describe "GET /api/v1/incidents" do
    context "when logged in" do
      it "returns incidents matching the search criteria" do
        signed_in_user_request :get, api_v1_incidents_path,
                                     params: { query: "Obstruction" }

        expect(json_parsed_body["raw_body"]).to_not be_empty
      end
    end

    context "when not logged in" do
      it "returns an error message to the user" do
        get api_v1_incidents_path, params: { query: "Obstruction" }

        expect(json_parsed_body["errors"]).to be_present
      end

      it "returns a 401 http status to the user" do
        get api_v1_incidents_path, params: { query: "Obstruction" }

        expect(response.status).to eq(401)
      end
    end
  end

end
