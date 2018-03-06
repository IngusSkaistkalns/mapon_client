module MaponClient
  class Resources
    class ObjectResource < Resources
      def list(params = {})
        @client['object/list'].get(
          params: with_key(params)
        )
      end

      def list_groups(params = {})
        @client['object/list_groups'].get(
          params: with_key(params)
        )
      end
    end
  end
end
