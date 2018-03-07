require 'json'

module MaponClient
  module Parsers
    class StructureParser < EmptyParser
      def parse
        JSON.parse(@data)
      end
    end
  end
end
