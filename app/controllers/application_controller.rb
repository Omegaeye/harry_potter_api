class ApplicationController < ActionController::API
  prepend_before_action :underscore_params!
  before_action :doorkeeper_authorize!

  private

  def doorkeeper_authorize!
    access_token = doorkeeper_token[:token] if doorkeeper_token.present?
    token = Doorkeeper::AccessToken.find_by(token: access_token )
    
    unless token.present?
      doorkeeper_render_error
    end
  end

  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end
end
