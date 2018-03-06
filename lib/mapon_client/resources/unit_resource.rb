module MaponClient
  class Resources
    class UnitResource < Resources
      def list(params = {})
        @client['unit/list'].get(
          params: with_key(params)
        )
      end
    end
  end
end
