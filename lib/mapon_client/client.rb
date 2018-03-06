require 'rest-client'
require 'mapon_client/resources'

module MaponClient
  class Client
    attr_reader :api_key, :base_url, :resource_base, :format

    def initialize(api_key: nil, base_url: nil, format: nil)
      @api_key = (
        api_key || ENV['MAPON_CLIENT_API_KEY']
      )

      @base_url = (
        base_url || MaponClient::DEFAULT_BASE_URL
      )

      @format = (
        format || MaponClient::DEFAULT_FORMAT
      )

      @resource_base ||= RestClient::Resource.new(
        @base_url, headers: { params: { key: @api_key } }
      )
    end

    def [](*args)
      @resource_base.public_send(
        :[],
        *append_format_to_url(*args)
      )
    end

    def resources
      @resources ||= Resources.new(self)
    end

    def with_key(params)
      params.merge(key: @api_key)
    end

    def append_format_to_url(*args)
      suburl = "#{args.shift}.#{@format}"
      args.unshift(suburl)
    end
  end
end
