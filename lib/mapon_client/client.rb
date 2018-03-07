require 'rest-client'
require 'mapon_client/resources'

module MaponClient
  class Client
    DEFAULT_BASE_URL = 'https://mapon.com/api/v1/'.freeze

    JSON = 'json'.freeze
    XML = 'xml'.freeze
    STRUCTURE = 'structure'.freeze
    OBJECT = 'object'.freeze

    AVAILABLE_FORMATS = [JSON, XML, STRUCTURE, OBJECT].freeze

    attr_reader :api_key, :base_url, :resource_base, :format, :request_format, :parser_class

    def initialize(api_key: nil, base_url: nil, format: nil)
      @api_key  = api_key  || ENV['MAPON_CLIENT_API_KEY']
      @base_url = base_url || DEFAULT_BASE_URL
      @format   = format   || JSON

      set_request_format
      set_parser_class

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

    Resources.descendants.each do |resource_class|
      class_eval %Q{
        def #{resource_class.resource_name}
          @#{resource_class.resource_name} ||= #{resource_class}.new(self)
        end
      }
    end

    def with_key(params)
      params.merge(key: @api_key)
    end

    def append_format_to_url(*args)
      suburl = "#{args.shift}.#{@request_format}"
      args.unshift(suburl)
    end

    private

    def set_request_format
      if @format == STRUCTURE || @format == OBJECT
        @request_format = JSON
      else
        @request_format = @format
      end
    end

    def set_parser_class
      @parser_class = if @format == STRUCTURE
        MaponClient::Parsers::StructureParser
      elsif @format == OBJECT
        MaponClient::Parsers::ObjectParser
      else
        MaponClient::Parsers::EmptyParser
      end
    end
  end
end
