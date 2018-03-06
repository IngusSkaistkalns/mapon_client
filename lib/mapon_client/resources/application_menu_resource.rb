module MaponClient
  class Resources
    class ApplicationMenuResource < Resources
      def list(params = {})
        @client['application_menu/list'].get(
          params: with_key(params)
        )
      end
    end
  end
end
