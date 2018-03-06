module MaponClient
  class Resources
    class FuelResource < Resources
      def summary(params = {})
        @client['fuel/summary'].get(
          params: with_key(params)
        )
      end

      def changes(params = {})
        @client['fuel/changes'].get(
          params: with_key(params)
        )
      end
    end
  end
end
