require "mapon_client/version"

module MaponClient
  DEFAULT_BASE_URL = 'https://mapon.com/api/v1/'.freeze
  DEFAULT_FORMAT = 'json'.freeze

  autoload :Client, 'mapon_client/client'
end
