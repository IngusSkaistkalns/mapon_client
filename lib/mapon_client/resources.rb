require 'mapon_client/resources/company_resource'
require 'mapon_client/resources/unit_resource'
require 'mapon_client/resources/unit_group_resource'
require 'mapon_client/resources/unit_data_resource'
require 'mapon_client/resources/route_resource'
require 'mapon_client/resources/fuel_resource'
require 'mapon_client/resources/object_resource'
require 'mapon_client/resources/user_resource'
require 'mapon_client/resources/driver_resource'
require 'mapon_client/resources/reefer_resource'
require 'mapon_client/resources/tachograph_resource'
require 'mapon_client/resources/tracking_resource'
require 'mapon_client/resources/data_forward_resource'
require 'mapon_client/resources/application_menu_resource'

module MaponClient
  class Resources
    AVAILABLE_RESOURCES = {
      company: CompanyResource,
      unit_group: UnitGroupResource,
      unit: UnitResource,
      unit_data: UnitDataResource,
      route: RouteResource,
      fuel: FuelResource,
      object: ObjectResource,
      user: UserResource,
      driver: DriverResource,
      reefer: ReeferResource,
      tachograph: TachographResource,
      tracking: TrackingResource,
      data_forward: DataForwardResource,
      application_menu: ApplicationMenuResource,
    }.freeze

    def initialize(client)
      @client = client
      @resources_repository = {}
    end

    def [](resource)
      return @resources_repository[resource] if @resources_repository[resource]
      raise ResourceNotFound.new(resource) unless AVAILABLE_RESOURCES[resource]
      @resources_repository[resource] = AVAILABLE_RESOURCES[resource].new(@client)
    end

    def with_key(params)
      @client.with_key(params)
    end
  end

  class ResourceNotFound < ::StandardError
  end
end
