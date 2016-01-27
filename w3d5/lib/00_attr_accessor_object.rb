class AttrAccessorObject
  def my_attr_accessor(*attr_names)
    attr_names.each do |attr_name|
      define_method(attr_name) do
        instance_variable_get("@#{attr_name}")
      end

      define_method("#{attr_name}=") do |value|
        instance_variable_set("@#{attr_name}", value)
      end
    end
  end
end
