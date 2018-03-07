module MaponClient
  class Resources
    class TachographResource < Resources
      generate_action name: 'list_ddd_driver'
      generate_action name: 'download_ddd_driver'
      generate_action name: 'list_ddd_vehicle'
      generate_action name: 'download_ddd_vehicle'
    end
  end
end
