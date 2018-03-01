Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/", to: "home#welcome"
    end
  end

end
