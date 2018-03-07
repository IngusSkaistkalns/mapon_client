module MaponClient
  class Resources
    class UnitDataResource < Resources
      generate_action name: 'ignitions'
      generate_action name: 'temperature'
      generate_action name: 'digital_inputs'
      generate_action name: 'can_period'
      generate_action name: 'can_point'
      generate_action name: 'fields'
      generate_action name: 'debug_info'
    end
  end
end
