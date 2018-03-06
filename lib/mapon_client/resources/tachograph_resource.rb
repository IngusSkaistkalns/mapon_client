module MaponClient
  class Resources
    class TachographResource < Resources
      def list_ddd_driver(params = {})
        @client['tachograph/list_ddd_driver'].get(
          params: with_key(params)
        )
      end

      def download_ddd_driver(params = {})
        @client['tachograph/download_ddd_driver'].get(
          params: with_key(params)
        )
      end

      def list_ddd_vehicle(params = {})
        @client['tachograph/list_ddd_vehicle'].get(
          params: with_key(params)
        )
      end

      def download_ddd_vehicle(params = {})
        @client['tachograph/download_ddd_vehicle'].get(
          params: with_key(params)
        )
      end
    end
  end
end
