module MaponClient
  class Resources
    class ObjectResource < Resources
      generate_action name: 'list'
      generate_action name: 'list_groups'
    end
  end
end
