module MaponClient
  module Helpers
    def resource_name
      self.name.sub(/.*::/, '').tap do |name|
        name.sub!(/Resource/, '')
        name.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        name.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        name.tr!("-", "_")
        name.downcase!
      end
    end
  end
end
