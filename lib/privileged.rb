module Privileged
  module Actor
    def privilege(actor_method, resource_method, options = {})
      options = { :default => false }.merge(options) 
      define_method actor_method do |resource|
        return options[:default] unless resource.respond_to?(resource_method)
        resource.send(resource_method, self)
      end
    end
  end
end