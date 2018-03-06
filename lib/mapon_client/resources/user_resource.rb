module MaponClient
  class Resources
    class UserResource < Resources
      def list(params = {})
        @client['user/list'].get(
          params: with_key(params)
        )
      end
    end
  end
end
