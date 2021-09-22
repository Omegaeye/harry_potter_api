# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json] if respond_to?(:wrap_parameters)
  include ::ActionController::ParamsNormalizer
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end
module ActionController
  module ParamsNormalizer
    extend ActiveSupport::Concern
    require 'mutex_m'

    def process_action(*args)
      normalized_keys = request.request_parameters.keys
      normalized_keys.each do |k|
        request.request_parameters[k.underscore] = request.request_parameters[k]
        request.request_parameters.delete(k) if k != k.underscore
      end
      super
    end
  end
end