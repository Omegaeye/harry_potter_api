# frozen_string_literal: true

Doorkeeper.configure do
  realm "Harry Potter"
  api_only
  base_controller "ActionController::API"
  orm :active_record
  default_scopes :read
  optional_scopes :write
  enforce_configured_scopes
  grant_flows %w[password]
  allow_blank_redirect_uri true
  skip_authorization { true }
  use_refresh_token

  resource_owner_from_credentials do |_routes|
    User.find_for_authentication(email: params[:email])
        .then { |user| user if user.valid_password?(params[:password]) }
  end
end
