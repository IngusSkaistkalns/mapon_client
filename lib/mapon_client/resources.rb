require 'mapon_client/helpers'

module MaponClient
  class Resources
    autoload :CompanyResource, 'mapon_client/resources/company_resource'
    autoload :UnitResource, 'mapon_client/resources/unit_resource'
    autoload :UnitGroupResource, 'mapon_client/resources/unit_group_resource'
    autoload :UnitDataResource, 'mapon_client/resources/unit_data_resource'
    autoload :RouteResource, 'mapon_client/resources/route_resource'
    autoload :FuelResource, 'mapon_client/resources/fuel_resource'
    autoload :ObjectResource, 'mapon_client/resources/object_resource'
    autoload :UserResource, 'mapon_client/resources/user_resource'
    autoload :DriverResource, 'mapon_client/resources/driver_resource'
    autoload :ReeferResource, 'mapon_client/resources/reefer_resource'
    autoload :TachographResource, 'mapon_client/resources/tachograph_resource'
    autoload :TrackingResource, 'mapon_client/resources/tracking_resource'
    autoload :DataForwardResource, 'mapon_client/resources/data_forward_resource'
    autoload :ApplicationMenuResource, 'mapon_client/resources/application_menu_resource'

    extend MaponClient::Helpers

    def self.descendants
      @descendants ||= begin
        classes = constants.map { |const_name| const_get(const_name) }
        classes.select { |klass| klass.name.end_with?('Resource') }
      end
    end

    def self.generate_action(name:, method: 'get')
      class_eval %{
        def #{name}(params = {})
          raw_response = @client['#{resource_name}/#{name}'].#{method}(
            params: with_key(params)
          ).body

          parse_repsonse(raw_response)
        end
      }
    end

    def initialize(client)
      @client = client
    end

    def with_key(params)
      @client.with_key(params)
    end

    def parse_repsonse(response)
      @client.parser_class.new(response).parse
    end
  end
end
