require "rails_helper"

describe "visitor visits home" do
  describe "GET /api/v1/" do
    it "sends a welcome message to the user" do
      get api_v1_path

      expect(json_parsed_body["message"]).to match /Welcome/
    end
  end

  def json_parsed_body
    JSON.parse(response.body)
  end
end
