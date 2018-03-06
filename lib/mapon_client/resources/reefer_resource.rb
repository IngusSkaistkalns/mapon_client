module MaponClient
  class Resources
    class ReeferResource < Resources
      def alert_list(params = {})
        @client['reefer/alert_list'].get(
          params: with_key(params)
        )
      end

      def runmodes(params = {})
        @client['reefer/runmodes'].get(
          params: with_key(params)
        )
      end

      def list_temperature_data(params = {})
        @client['reefer/list_temperature_data'].get(
          params: with_key(params)
        )
      end
    end
  end
end
