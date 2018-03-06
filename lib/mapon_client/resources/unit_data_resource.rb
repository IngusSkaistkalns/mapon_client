module MaponClient
  class Resources
    class UnitDataResource < Resources
      def ignitions(params = {})
        @client['unit_data/ignitions'].get(
          params: with_key(params)
        )
      end

      def temperature(params = {})
        @client['unit_data/temperature'].get(
          params: with_key(params)
        )
      end

      def digital_inputs(params = {})
        @client['unit_data/digital_inputs'].get(
          params: with_key(params)
        )
      end

      def can_period(params = {})
        @client['unit_data/can_period'].get(
          params: with_key(params)
        )
      end

      def can_point(params = {})
        @client['unit_data/can_point'].get(
          params: with_key(params)
        )
      end

      def fields(params = {})
        @client['unit_data/fields'].get(
          params: with_key(params)
        )
      end

      def debug_info(params = {})
        @client['unit_data/debug_info'].get(
          params: with_key(params)
        )
      end
    end
  end
end
