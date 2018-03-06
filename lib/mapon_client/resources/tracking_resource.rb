module MaponClient
  class Resources
    class TrackingResource < Resources
      def list(params = {})
        @client['tracking/list'].get(
          params: with_key(params)
        )
      end
    end
  end
end
