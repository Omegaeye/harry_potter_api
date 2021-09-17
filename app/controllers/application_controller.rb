class ApplicationController < ActionController::API
  before_action :doorkeeper_authorize!

  def doorkeeper_authorize!(*scopes)
    @_doorkeeper_scopes = scopes.presence || Doorkeeper.configuration.default_scopes
    return if Doorkeeper.configuration.skip_authorization
    unless valid_doorkeeper_token?
      doorkeeper_render_error
    end
  end

  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end
end
