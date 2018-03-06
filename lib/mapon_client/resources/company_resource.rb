module MaponClient
  class Resources
    class CompanyResource < Resources
      def get
        @client['company/get'].get
      end
    end
  end
end
