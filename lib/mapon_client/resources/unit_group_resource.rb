module MaponClient
  class Resources
    class UnitGroupResource < Resources
      generate_action name: 'list'
      generate_action name: 'list_units'
    end
  end
end
