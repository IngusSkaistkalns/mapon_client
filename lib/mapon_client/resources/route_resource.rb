module MaponClient
  class Resources
    class RouteResource < Resources
      def list(params = {})
        @client['route/list'].get(
          params: with_key(params)
        )
      end

      def custom_fields(params = {})
        @client['route/custom_fields'].get(
          params: with_key(params)
        )
      end
    end
  end
end
