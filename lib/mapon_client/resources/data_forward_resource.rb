module MaponClient
  class Resources
    class DataForwardResource < Resources
      generate_action name: 'list'
      generate_action name: 'list_packs'
    end
  end
end
