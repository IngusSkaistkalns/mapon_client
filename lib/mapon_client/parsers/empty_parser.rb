module MaponClient
  module Parsers
    class EmptyParser
      def initialize(data)
        @data = data
      end

      def parse
        @data
      end
    end
  end
end
