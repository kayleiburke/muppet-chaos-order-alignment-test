class Choice
  extend ActiveRecordLite::ClassMethods

  attr_accessor :label

  def initialize(id:, label:, question_id:, order:)
    @id = id
    @label = label
    @question_id = question_id
    @order = order
  end

  def self.attr_int(*args)
    args.each do |method_name|
      define_method(method_name) do
        instance_variable_get("@#{method_name.to_s}").to_i
      end

      define_method("#{method_name}=") do |new_val|
        instance_variable_set("@#{method_name.to_s}", new_val.to_i)
      end
    end
  end

  attr_int :id, :question_id, :order
end