module MaponClient
  class Resources
    class ReeferResource < Resources
      generate_action name: 'alert_list'
      generate_action name: 'runmodes'
      generate_action name: 'list_temperature_data'
    end
  end
end
