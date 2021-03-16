class Quiz
  attr_accessor :name, :description, :instructions, :questions, :choices, :outcomes, :choices_outcomes

  def initialize(id, description, instructions, questions, choices, outcomes, choices_outcomes)
    @id = id
    @description = description
    @instructions = instructions
    @questions = create_objects("Question", questions)
    @choices = create_objects("Choice", choices)
    @outcomes = create_objects("Outcome", outcomes)
    @choices_outcomes = create_objects("ChoicesOutcome", choices_outcomes)
  end

  def create_objects(object_name, input_list)
    arr = []
    input_list.each do |input|
      values = []
      input_list.headers.each do |header|
        values.push(input[header])
      end
      arr.push(create_object(object_name, values))
    end
    arr
  end

  def create_object(object_name, values)
    Kernel.const_get(object_name).new(*values)
  end
end