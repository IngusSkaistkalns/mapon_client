require 'json'
require 'ostruct'

module MaponClient
  module Parsers
    class ObjectParser < EmptyParser
      def parse
        JSON.parse(@data, object_class: OpenStruct)
      end
    end
  end
end
