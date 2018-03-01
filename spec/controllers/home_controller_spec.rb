require "rails_helper"

describe HomeController, type: :controller do

  describe "#welcome" do
    it "redirects the user to the api_v1_root_path" do
      get :welcome

      expect(response).to redirect_to(api_v1_root_path)
    end
  end

end
