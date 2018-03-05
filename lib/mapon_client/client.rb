require 'rest-client'

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
      @resource_base.public_send(:[], *args)
    end

    def company
      self[with_format("company/get")].get
    end

    def unit_list
      self[with_format("unit/list")].get
    end

    private

    def with_format(suburl)
      "#{suburl}.#{@format}"
    end
  end
end
