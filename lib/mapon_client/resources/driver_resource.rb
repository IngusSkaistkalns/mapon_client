module MaponClient
  class Resources
    class DriverResource < Resources
      def list(params = {})
        @client['driver/list'].get(
          params: with_key(params)
        )
      end
    end
  end
end
