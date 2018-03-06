module MaponClient
  class Resources
    class DataForwardResource < Resources
      def list(params = {})
        @client['data_forward/list'].get(
          params: with_key(params)
        )
      end

      def list_packs(params = {})
        @client['data_forward/list_packs'].get(
          params: with_key(params)
        )
      end
    end
  end
end
