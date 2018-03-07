module MaponClient
  class Resources
    class RouteResource < Resources
      generate_action name: 'list'
      generate_action name: 'custom_fields'
    end
  end
end
