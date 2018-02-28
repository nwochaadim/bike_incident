DeviseTokenAuth.setup do |config|
  config.token_lifespan = 2.weeks
  config.default_confirm_success_url = "/incidents"
end
