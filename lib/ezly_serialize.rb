require "ezly_serialize/version"
require "ezly_serialize/configuration"

module EzlySerialize
  def deserialize(source)
    data = Configuration.serializer.load(source)
    data.each { |k, v| instance_variable_set("@#{k}", v) }
    
    self
  end

  def serialize
    obj = instance_variables.map do |k|
      [k.to_s.sub('@', ''), instance_variable_get(k)]
    end.to_h
    
    Configuration.serializer.dump(obj)
  end
end
