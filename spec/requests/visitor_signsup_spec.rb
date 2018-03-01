require "rails_helper"

describe "Visitor signsup spec", type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe "POST /auth" do
    context "when successful" do
      it "creates a new user account" do
        params = { name: "Test",
                   email: "test@test.com",
                   password: "password",
                   password_confirmation: "password" }

        expect { post user_registration_path, params: params, headers: headers }.
          to change{ User.count }.by(1)
      end

      it "returns a success payload" do
        params = { name: "Test",
                   email: "test@test.com",
                   password: "password",
                   password_confirmation: "password" }

        post user_registration_path, params: params, headers: headers

        expect(json_parsed_body["status"]).to eq("success")
      end
    end

    context "when not successful" do
      it "does not create a user account" do
        params = { name: "Test",
                   password_confirmation: "password" }

        expect { post user_registration_path, params: params, headers: headers }.
          to_not change{ User.count }
      end

      it "responds with an error status to the user" do
        params = { name: "Test",
                   password_confirmation: "password" }

        post user_registration_path, params: params, headers: headers

        expect(json_parsed_body["status"]).to eq("error")
      end
    end
  end
end
