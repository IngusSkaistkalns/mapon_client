module MaponClient
  class Resources
    class UnitGroupResource < Resources
      def list(params = {})
        @client['unit_groups/list'].get(
          params: with_key(params)
        )
      end

      def list_units(params = {})
        @client['unit_groups/list_units'].get(
          params: with_key(params)
        )
      end
    end
  end
end
