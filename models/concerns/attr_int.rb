module AttrInt
  def attr_int(*args)
    args.each do |method_name|
      define_method(method_name) do
        instance_variable_get("@#{method_name.to_s}").to_i
      end

      define_method("#{method_name}=") do |new_val|
        instance_variable_set("@#{method_name.to_s}", new_val.to_i)
      end
    end
  end
end