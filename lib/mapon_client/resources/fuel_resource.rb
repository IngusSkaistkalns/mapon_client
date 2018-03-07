module MaponClient
  class Resources
    class FuelResource < Resources
      generate_action name: 'summary'
      generate_action name: 'changes'
    end
  end
end
