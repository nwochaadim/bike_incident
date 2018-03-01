require "rails_helper"

describe "User signs out", type: :request do

  describe "DELETE /auth/sign_out" do
    context "for a signed in user" do
      it "removes the user session" do
        user = create(:user, email: "test@test.com",
                             password: "password")
        credentials = login_user(email: "test@test.com", password: "password")

        delete destroy_user_session_path, params: credentials

        expect(json_parsed_body["success"]).to be_truthy
      end
    end

    context "for a non signed in user" do
      it "removes the user session" do
        user = create(:user, email: "test@test.com",
                             password: "password")

        delete destroy_user_session_path

        expect(json_parsed_body["errors"]).to be_present
      end
    end
  end

end
